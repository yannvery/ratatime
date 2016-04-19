FactoryGirl.define do
  factory :ratatime_user, class: User do
    email 'foo@bar.com'
    password 'foobar'
  end
end
