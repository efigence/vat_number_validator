require 'httparty'
require 'pry'

class VatNumberValidator < ActiveModel::EachValidator
  require 'vat_number_validator/configuration'
  require 'vat_number_validator/errors'

  include HTTParty

  base_uri 'http://apilayer.net/api'

  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors.add(attribute, :incorrect_vat_number_format)
    end
  end

  private

  def valid?(value)
    result = self.class.get('/validate', http_options(value))
    raise(VatlayerError.new(result)) if result['success'] == false
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
