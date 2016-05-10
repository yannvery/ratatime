class Project < ApplicationRecord
  include UserScopesConcern
  has_many :trackers
  belongs_to :user
end
