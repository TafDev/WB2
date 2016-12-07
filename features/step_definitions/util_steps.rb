require 'pry'
Given(/^I am logged in as "([^"]+)"$/) do |username|
	log_on_as(username)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
	fill_in(field, :with => content)
end

When(/^I visit "([^"]+)"$/) do |page|
	visit get_named_route(page)
end

When(/^I click "([^"]+)"$/) do |text|
	# save_and_open_page
	click_on(text)
end

Then(/^I should see "([^"]*)"$/) do |content|
	expect(page.body).to match(content)
end
