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
    result['valid']
  end

  def http_options(value)
    {
      query: {
        access_key: Configuration.access_key,
        vat_number: value
      }
    }
  end
end
