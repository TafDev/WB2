When(/^I visit the account page for user "([^"]+)"$/) do |username|
	# save_and_open_page
	user = User.find_by(username: username)
	visit get_named_route("user_account", user)
end

When(/^Sleep (\d+)$/) do |seconds|
	sleep(seconds.to_i)
end

When(/^I click css "([^"]*)" within_frame "([^"]*)"$/) do |link, selector|
	within_frame(selector) do
		find(:css, link).click
	end
end

Then (/^I am now a premium member$/) do
	expect(@barvis.account.stripeid).to be_truthy
end

When(/^I fill in "([^"]*)" with "([^"]*)" within_frame "([^"]*)"$/) do |field, content, selector|
	within_frame(selector) do
		fill_in(field, with: content)
	end
end

