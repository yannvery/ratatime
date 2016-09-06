module Chronic
  class Hours < Duration
    def to_seconds
      magnitude * 3600.0
    end

    def to_minutes
      magnitude * 60.0
    end

    def to_hours
      magnitude
    end

    def +(other)
      self.class.new(magnitude + other.to_hours)
    end

    def decorate
      HoursDecorator.new self
    end
  end
end
