module TrackerHelper
  def tracker_duration(duration)
    return time_ago_in_words(Time.current - duration) if duration.is_a? Integer
    ''
  end
end
