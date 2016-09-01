module ProjectHelper

  def project_chart_data(user, date)
    ProjectChart.new(user: user).by_date(date).values.map { |p| p[:value] }
  end

  def project_chart_duration(user, date)
    value = ''
    duration = ProjectChart.new(user: user).by_date(date).values.inject(0) { |sum, p| sum + p[:value] } * 3600
    return value if duration == 0
    duration_str = Time.at(duration).utc.strftime("%H:%M:%S")
    hours_minutes_regx = /^(?<Hours>\d+):(?<Minutes>\d+):(?<Seconds>\d+)$/x
    parts = duration_str.to_s.match(hours_minutes_regx)

    if parts && parts['Hours'].present? && parts['Hours'] != "00"
      value = value + "#{parts['Hours']}h "
    end
    if parts && parts['Minutes'].present?
      value = value + "#{parts['Minutes']}m "
    end
    value
  end

  def project_chart_color(user, date)
    ProjectChart.new(user: user).by_date(date).values.map { |p| p[:color] || 'grey'}
  end

  def project_chart_label(user, date)
    ProjectChart.new(user: user).by_date(date).values.map { |p| ''}
  end
end
