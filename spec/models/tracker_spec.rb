require 'rails_helper'

RSpec.describe Tracker, '#valid?' do
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:project) }
end

RSpec.describe Tracker, '#save' do
  it 'accepts 10m as an input and convert it to 600 seconds' do
    tracker = build(:tracker)
    tracker.duration = '10m'
    tracker.save
    expect(tracker.duration_time).to eq 600
  end

  it 'accepts 09:30 as an input and convert it to 34200 seconds' do
    tracker = build(:tracker)
    tracker.duration = '09:30'
    tracker.save
    expect(tracker.duration_time).to eq 34_200
  end
end
