When(/^I visit the profile page for user "([^"]*)"$/) do |username|
	user = User.find_by(username: username)
	visit get_named_route("user_profile", user)
end

