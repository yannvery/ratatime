describe ProjectPolicy do
  subject { described_class }

  permissions :update?, :edit?, :show?, :destroy? do
    it 'denies access current_user is not the owner' do
      user = create(:user)
      project = build(:project, user: user)
      expect(subject).not_to permit(build(:user), project)
    end

    it 'grants access if current_user is the owner' do
      user = create(:user)
      project = build(:project, user: user)
      expect(subject).to permit(user, project)
    end
  end
end
