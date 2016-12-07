Given(/^I have sample users$/) do
	@barvis = User.create(username: "Barvis", email: "barvis@test.com", password: "123456")
	@mavis = User.create(username: "mavis", email: "mavis@test.com", password: "123456")
end

Then(/^My email address should be the same as the facebook email$/) do
	expect(User.last.email).to eq("email@email.com")
end
