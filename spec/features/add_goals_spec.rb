require 'rails_helper'

RSpec.feature "Adding Goal", type: :feature do
	let(:barvis) {create(:user)}

	before do
		login_as(barvis)
		visit '/'
	end

	scenario "add a goal with invalid input", js: true do
		click_on "Add Goal"
		page.execute_script("$('#goal-form').show()")
		fill_in "goal[body]", with: ""
		click_button "Create Goal"
		expect(Goal.all.count).to be 0
		# expect(page).to have_content("Please fill out this field.")
	end

	scenario "add a goal with valid input", js: true do
		click_on "Add Goal"
		page.execute_script("$('#goal-form').show()")
		fill_in "goal[body]", with: "Lose 20kg in 2 weeks"
		click_button "Create Goal"
		expect(page).to have_content("Lose 20kg in 2 weeks")
	end

end
