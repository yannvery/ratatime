class ProjectPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def show?
    project.user_id == user.id
  end

  def edit?
    project.user_id == user.id
  end

  def update?
    project.user_id == user.id
  end

  def destroy?
    project.user_id == user.id
  end
end
