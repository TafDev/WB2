require 'pry'
Given(/^I am logged in as "([^"]+)"$/) do |username|
	log_on_as(username)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
	# binding.pry
	fill_in(field, :with => content)
end

When(/^I visit "([^"]+)"$/) do |page|
	visit get_named_route(page)
end

Then(/^They are redirected to the "([^"]*)" page$/) do |page|
	expect(current_path).to eq(get_named_route(page))
end

When(/^I click "([^"]+)"$/) do |text|
	click_on(text)
end

Then(/^I should see "([^"]*)"$/) do |content|
	expect(page.body).to match(content)
end

When(/^I click "([^"]*)" within "([^"]*)"$/) do |link, css|
	within(:css, css) do
		click_on(link)
	end
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |option, select_box|
	select(option, :from => select_box)
end


When(/^I press "([^"]*)"(?: on "([^"]*)"|)$/) do |key, css_selector|
	keypress = "var e = $.Event('keydown', { keyCode: 13 }); $('body').trigger(e);"
	page.driver.execute_script(keypress)

	css_selector ||= 'body'
	case key
		when "ENTER"
			keycode = 13
		when "TAB"
			keycode = 9
		when "SPACE"
			keycode = 32
	end
	keypress_script = "var e = $.Event('keydown', { keyCode: #{keycode}  }); $('#{css_selector}').trigger(e);"
	page.driver.execute_script(keypress_script)
end

Then(/^I press Enter$/) do
	keypress = "var e = $.Event('keydown', { keyCode: 13 }); $('body').trigger(e);"
	page.driver.execute_script(keypress)
end


When(/^I click css "([^"]*)"$/) do |css|
	find(:css, css).click
end

When(/^I fill in "([^"]*)" with "([^"]*)" within "([^"]*)"$/) do |field, content, css|
	within(:css, css) do
		fill_in(field, :with => content)
	end
end
