require 'rails_helper'

RSpec.feature "Goal", type: :feature do
	let(:barvis) {create(:user)}

	before do
		login_as(barvis)
		@goal = barvis.profile.goals.create(body: "run a marathon on 15 mins")
	end

	scenario "remove a goal from profile" do
		visit '/'
		within(:css, '#goal-body-1') do
			page.find('#trash-1').click
		end
		expect(page).not_to have_content(@goal)
	end
end