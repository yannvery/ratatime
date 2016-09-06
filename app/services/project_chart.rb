class ProjectChart
  def self.for(user: nil, date: nil)
    return [] if user.nil? || date.nil?
    grouped_tracker = Tracker.select('project_id, logged_date, sum(duration_time) as duration').where(user: user).where(logged_date: (date - 5.days)..date).group('project_id, logged_date')
    grouped_tracker.map { |t| ProjectChart.new(project: t.project, duration: t.duration, color: t.project.color, logged_date: t.logged_date) }
  end

  attr_reader :project, :duration, :color, :logged_date

  def initialize(project: nil, duration: nil, color: nil, logged_date: nil)
    @project = project
    @duration = duration
    @color = color
    @logged_date = logged_date
  end
end
