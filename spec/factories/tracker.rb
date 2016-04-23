FactoryGirl.define do
  factory :tracker do
    duration '10'
    duration_time 10
    description 'foobar'
    user
  end
end
