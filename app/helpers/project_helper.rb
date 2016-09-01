module ProjectHelper

  def project_chart_data(user, date)
    ProjectChart.new(user: user).by_date(date).values.map { |p| p[:value] }
  end

  def project_chart_color(user, date)
    ProjectChart.new(user: user).by_date(date).values.map { |p| p[:color] || 'grey'}
  end

  def project_chart_label(user, date)
    ProjectChart.new(user: user).by_date(date).values.map { |p| ''}
  end
end
