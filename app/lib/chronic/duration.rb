module Chronic
  class Duration
    def self.for(raw_value)
      case raw_value
      when Chronic::Duration
        raw_value
      when /\A(\d+)\s*[h:]\s*(\d+)\s*m?\z/i
        Minutes[$2.to_i] + Hours[$1.to_i]
      when /\A(\d+)\s*h\z/i
        Hours[$1.to_i]
      when /\A(\d+)\s*m?\z/i
        Minutes[$1.to_i]
      when /\A(\d+)\s*s\z/i
        Minutes[1]
      when String
        ExceptionalValue.new(raw_value, reason: "Unrecognized format")
      else
        fail TypeError, "Can't make a Duration from #{raw_value.inspect}"
      end
    end

    def self.[](magnitude)
      new(magnitude)
    end

    attr_reader :magnitude

    def initialize(magnitude)
      @magnitude = magnitude
      freeze
    end

    def inspect
      "#{self.class}[#{magnitude}]"
    end

    def to_s
      "#{magnitude} #{self.class.name.downcase}"
    end

    def to_seconds
      magnitude
    end

    def to_minutes
      magnitude / 60.0
    end

    def to_hours
      magnitude / 3600.0
    end

    def +(other)
      self.class.new(magnitude + other.to_seconds)
    end
  end
end
