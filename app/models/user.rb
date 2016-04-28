class User < ActiveRecord::Base
  include Clearance::User
  has_many :trackers
  has_many :projects
end
