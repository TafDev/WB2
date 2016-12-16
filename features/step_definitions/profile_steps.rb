When(/^I visit the profile page for user "([^"]*)"$/) do |username|
	user = User.find_by(username: username)
	visit get_named_route("user_profile", user)
end

Then(/^I should have "([^"]*)"$/) do |content|
	user = User.find_by(username: "Barvis")
  expect(user.profile.sports.count).to be(1)
	expect(page.body).to have_content(content)
end

