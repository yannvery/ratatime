require 'rails_helper'

RSpec.describe ProjectChart, '.for' do
  it 'accepts parameters :user and :date and return an array' do
    user = create(:user)
    expect(ProjectChart.for(user: user, date: '2016-08-25'.to_date).class).to eq Array
  end

  it 'returns an array of ProjectChart objects' do
    user = create(:user, email: 'yann@ratatime.com')
    ratatime = create(:project, name: 'Ratatime', color: 'red')
    ratatime_tracker_1 = create(:tracker, project: ratatime, duration: '60m', logged_date: '2016-08-25', user: user)
    ratatime_tracker_2 = create(:tracker, project: ratatime, duration: '2:00', logged_date: '2016-08-25', user: user)

    project_charts = ProjectChart.for(user: user, date: '2016-08-25'.to_date)
    expect(project_charts.first.class).to eq ProjectChart
  end

  it 'returns a ProjectChart which duration is the sum of existing trackers on 5 days range date for a project' do
    user = create(:user, email: 'yann@ratatime.com')
    ratatime = create(:project, name: 'Ratatime', color: 'red')
    admin = create(:project, name: 'Admin', color: 'white')
    ratatime_tracker_1 = create(:tracker, project: ratatime, duration: '60m', logged_date: '2016-08-25', user: user)
    ratatime_tracker_2 = create(:tracker, project: ratatime, duration: '2:00', logged_date: '2016-08-25', user: user)
    admin_tracker = create(:tracker, project: admin, duration: '3:00', logged_date: '2016-08-25', user: user)

    project_charts = ProjectChart.for(user: user, date: '2016-08-25'.to_date)
    expect(project_charts.first.duration).to eq '10800'
    expect(project_charts.first.project.id).to eq ratatime.id
  end
end
