module Chronic
  class Minutes < Duration
    def to_seconds
      magnitude * 60.0
    end

    def to_minutes
      magnitude
    end

    def to_hours
      magnitude / 60.0
    end

    def +(other)
      self.class.new(magnitude + other.to_minutes)
    end
  end
end
