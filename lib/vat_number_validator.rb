require 'httparty'

class VatNumberValidator < ActiveModel::EachValidator
  require 'vat_number_validator/configuration'
  require 'vat_number_validator/errors'

  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors.add(attribute, :incorrect_vat_number_format)
    end
  end

  private

  def base_uri
    protocol = Configuration.use_https ? 'https' : 'http'
    "#{protocol}://apilayer.net/api"
  end

  def valid?(value)
    result = HTTParty.get(base_uri + '/validate', http_options(value))
    raise(APIError.new(result)) if result['success'] == false
    options[:check] == :format ? result['format_valid'] : result['valid']
  end

  def http_options(value)
    default_options = Configuration.http_options
    query_options = {
      query: {
        access_key: Configuration.access_key, vat_number: value
      }
    }
    if default_options && default_options.is_a?(Hash)
      default_options.merge(query_options)
    else
      query_options
    end
  end
end
