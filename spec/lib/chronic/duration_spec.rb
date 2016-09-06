require 'rails_helper'

RSpec.describe Chronic::Duration, '#magnitude' do
  it 'returns initial value' do
    duration = Chronic::Duration.new(90)
    expect(duration.magnitude).to eq 90
  end

  it 'always return real value even when to_s and inspect have not same precision' do
    duration = Chronic::Duration.for('8h30')
    expect(duration.magnitude).to eq 510
  end
end

RSpec.describe Chronic::Duration, '#inspect' do
  it 'returns class and magnitude' do
    duration = Chronic::Duration.new(90)
    expect(duration.inspect).to eq 'Chronic::Duration[90]'
  end
end

RSpec.describe Chronic::Duration, '#to_s' do
  it 'returns magnitude and class' do
    duration = Chronic::Duration.new(90)
    expect(duration.to_s).to eq '90 chronic::duration'
  end
end

RSpec.describe Chronic::Duration, '.for' do
  it 'returns Minutes object even value is less than a minute' do
    obj = Chronic::Duration.for('30s')
    expect(obj.to_s).to eq '1 chronic::minutes'
  end

  it 'returns Minutes object for 30m' do
    obj = Chronic::Duration.for('30m')
    expect(obj.to_s).to eq '30 chronic::minutes'
  end

  it 'returns Hours object for 8h' do
    obj = Chronic::Duration.for('8h')
    expect(obj.to_s).to eq '8 chronic::hours'
  end

  it 'returns Minutes object for 8h30' do
    obj = Chronic::Duration.for('8h30')
    expect(obj.to_s).to eq '510.0 chronic::minutes'
  end

  it 'returns Minutes object for 8:30' do
    obj = Chronic::Duration.for('8:30')
    expect(obj.to_s).to eq '510.0 chronic::minutes'
  end

  it 'returns an ExcptionalValue when entry is not readable' do
    obj = Chronic::Duration.for('Not readable')
    expect(obj.class).to eq Chronic::ExceptionalValue
  end
end
