require 'rails_helper'

RSpec.describe Tracker, '#duration=' do
  it 'accepts 10m as an input and convert it to 600 seconds' do
    tracker = create(:tracker)
    tracker.duration = '10m'
    expect(tracker.duration).to eq 600
  end
end