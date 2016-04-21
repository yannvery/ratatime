class Tracker < ApplicationRecord
  
  def duration=(value)
    return write_attribute(:duration, value) if value.is_a? Integer
    duration_regx = /
    ^                  # Starting at the front of the string
    (?<Minutes>\d+)m       # Capture one or more digits; call the result "SrNo"  
    $                  # Make sure that we're at the end of the line now
    /x

    parts = value.to_s.match(duration_regx)
    write_attribute(:duration, parts['Minutes'].to_i * 60)
  end
end
