class VatNumberValidator
  class APIError < StandardError
    def initialize(result)
      code = result['error']['code']
      message = case code
                when 101
                  'invalid/missing access_key'
                when 104
                  'usage limit reached'
                when 105
                  'https access restricted'
                when 102
                  'inactive user'
                else
                  "vatlayer API error code #{code}"
                end
      super(message)
    end
  end
end
