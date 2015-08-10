require 'confiture'

class VatNumberValidator
  class Configuration
    include Confiture::Configuration

    confiture_allowed_keys(:access_key, :use_https, :http_options)
  end
end
