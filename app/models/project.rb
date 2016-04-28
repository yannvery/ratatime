class Project < ApplicationRecord
  has_many :trackers
  belongs_to :user
end
