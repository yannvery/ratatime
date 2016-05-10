class TrackerPolicy
  attr_reader :user, :tracker

  def initialize(user, tracker)
    @user = user
    @tracker = tracker
  end

  def show?
    tracker.user_id == user.id
  end

  def update?
    tracker.user_id == user.id
  end

  def edit?
    tracker.user_id == user.id
  end

  def destroy?
    tracker.user_id == user.id
  end
end
