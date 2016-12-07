When(/^I visit the account page for user "([^"]+)"$/) do |username|
	user = User.find_by(username: username)
	visit get_named_route("user_account", user)
end