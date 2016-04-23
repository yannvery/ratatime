class Tracker < ApplicationRecord
  belongs_to :user

  validates :duration, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  before_save :convert_duration

  private

  def convert_duration
    convert_value = convert_seconds_for_duration(duration)
    convert_value ||= convert_minutes_for_duration(duration)
    convert_value ||= convert_hours_and_minutes_for_duration(duration)
    self.duration_time = convert_value
  end

  def convert_seconds_for_duration(value)
    seconds_regx = /^(?<Seconds>\d+)$/x
    parts = value.to_s.match(seconds_regx)
    return parts['Seconds'].to_i if parts && parts['Seconds'].present?
    false
  end

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
