FactoryGirl.define do
  factory :tracker do
    logged_date { Date.current }
    duration '10'
    duration_time 10
    description 'foobar'
    user
  end
end
