require 'confiture'

class VatNumberValidator
  class Configuration
    include Confiture::Configuration

    confiture_allowed_keys(:access_key)
  end
end
