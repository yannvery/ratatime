module Chronic
  class ExceptionalValue
    def initialize(raw_value, reason: 'Unspecified')
      @raw    = raw_value
      @reason = reason
    end

    attr_reader :reason

    def exceptional?
      true
    end

    def to_s
      @raw.to_s
    end
  end
end
