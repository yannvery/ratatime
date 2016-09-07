class Project < ApplicationRecord
  include UserScopesConcern
  has_many :trackers
  belongs_to :user

  def color
    self[:color] || '#FF0000'
  end
end
