
Then(/^I should have sent a message$/) do
	expect(@barvis.messages.count).to be 1
end

Given(/^"([^"]*)" is premium$/) do |username|
	user = User.find_by(username: username)
	user.account.is_premium = true
	expect(user.account.is_premium).to be true
end

