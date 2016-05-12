require 'active_support/concern'

module UserScopesConcern
  extend ActiveSupport::Concern

  included do
    scope :by_user, ->(user) { where(user_id: user.id) }
  end
end
