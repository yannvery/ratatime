module ProjectHelper

  def project_chart_data(date, project_charts)
    charts = project_charts.select { |p| p.logged_date == date}
    charts.map(&:duration)
  end

  def project_chart_duration(date, project_charts)
    ''
  end

  def project_chart_color(date, project_charts)
    charts = project_charts.select { |p| p.logged_date == date}
    charts.map(&:color)
  end

  def project_chart_label(date, project_charts)
    charts = project_charts.select { |p| p.logged_date == date}
    charts.map { |p| ''}
  end
end
