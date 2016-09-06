class Tracker < ApplicationRecord
  include UserScopesConcern
  belongs_to :user
  belongs_to :project

  validates :logged_date, presence: true
  validates :duration, presence: true
  validates :description, presence: true
  validates :project, presence: true
  validates :user, presence: true

  scope :by_logged_date, -> { order(logged_date: :desc) }

  validate :duration_must_be_readable
  before_save :set_duration_time

  def project_name
    project.name if project
  end

  private

  def duration_must_be_readable
    return unless duration
    chronic_duration = Chronic::Duration.for(duration)
    if chronic_duration.is_a? Chronic::ExceptionalValue
      errors.add(:duration, :invalid, message: chronic_duration.reason)
    end
  end

  def set_duration_time
    self.duration_time = Chronic::Duration.for(duration).to_seconds
  end
end
