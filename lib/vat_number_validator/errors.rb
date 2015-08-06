class VatNumberValidator
  class APIError < StandardError
    def initialize(result)
      message = case result['code']
                when 101
                  'invalid/missing access_key'
                when 104
                  'usage limit reached'
                when 105
                  'https access restricted'
                when 102
                  'inactive user'
                else
                  "vatlayer API error code #{result['code']}"
                end
      super(message)
    end
  end
end
