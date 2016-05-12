describe TrackerPolicy do
  subject { described_class }

  permissions :update?, :edit?, :show?, :destroy? do
    it 'denies access current_user is not the owner' do
      user = create(:user)
      tracker = build(:tracker, user: user)
      expect(subject).not_to permit(build(:user), tracker)
    end

    it 'grants access if current_user is the owner' do
      user = create(:user)
      tracker = build(:tracker, user: user)
      expect(subject).to permit(user, tracker)
    end
  end
end
