class Project < ApplicationRecord
  include UserScopesConcern
  has_many :trackers
  belongs_to :user
  validates :name, presence: true
end
