require 'rails_helper'

RSpec.describe Project, '#valid?' do
  it { should validate_presence_of(:name) }
end
