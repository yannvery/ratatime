class TrackerPolicy
  attr_reader :user, :tracker

  def initialize(user, tracker)
    @user = user
    @tracker = tracker
  end

  def show?
    tracker.user_id == user.id
  end
end
