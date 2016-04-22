class Tracker < ApplicationRecord
  def duration=(value)
    return write_attribute(:duration, value) if value.is_a? Integer
    convert_value = convert_minutes_for_duration(value)
    convert_value ||= convert_hours_and_minutes_for_duration(value)
    write_attribute(:duration, convert_value)
  end

  private

  def convert_minutes_for_duration(value)
    minutes_regx = /^(?<Minutes>\d+)m$/x
    parts = value.to_s.match(minutes_regx)
    return parts['Minutes'].to_i * 60 if parts && parts['Minutes'].present?
    false
  end

  def convert_hours_and_minutes_for_duration(value)
    hours_minutes_regx = /^(?<Hours>\d+):(?<Minutes>\d+)$/x
    parts = value.to_s.match(hours_minutes_regx)
    if parts && parts['Minutes'].present? && parts['Hours'].present?
      return parts['Hours'].to_i * 3600 + parts['Minutes'].to_i * 60
    else
      return false
    end
  end
end
