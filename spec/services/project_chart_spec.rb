require 'rails_helper'

RSpec.describe ProjectChart, '#by_date' do
  it 'returns time spent by a user for 1 workday for each project' do
    user = create(:user, email: 'yann@ratatime.com')
    ratatime = create(:project, name: 'Ratatime', color: 'red')
    admin = create(:project, name: 'Admin', color: 'white')
    ratatime_tracker_1 = create(:tracker, project: ratatime, duration: '60m', logged_date: '2016-08-25', user: user)
    ratatime_tracker_2 = create(:tracker, project: ratatime, duration: '2:00', logged_date: '2016-08-25', user: user)
    admin_tracker = create(:tracker, project: admin, duration: '3:00', logged_date: '2016-08-25', user: user)

    data = ProjectChart.new(user: user).by_date('2016-08-25'.to_date)
    expect(data).to eq ({
      ratatime.id.to_s => { value: 3, color: 'red' },
      admin.id.to_s => { value: 3, color: 'white' }
    })
  end
end
