class ProjectChart
  def initialize(user: nil)
    @user = user
  end

  def by_date(day)
    Tracker.where(user: @user).where(logged_date: day).each_with_object({}) do |tracker, memo|
      project = tracker.project
      memo[project.id] = Hash.new(0) unless memo.key?(project.id)
      memo[project.id][:value] += tracker.duration_time / 3600.0
      memo[project.id][:color] = project.color
    end
  end
end
