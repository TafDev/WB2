require 'rails_helper'

RSpec.feature "Goal", type: :feature do
	let(:barvis) {create(:user)}

	before do
		login_as(barvis)
		@goal = barvis.profile.goals.create(body: "run a marathon on 15 mins")
	end

	scenario "user marks goal as complete", :js => true do
		visit '/'
		page.check('goal-1')
		expect(@goal.reload.is_complete?).to be true
	end
end