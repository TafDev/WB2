When(/^I upload an image$/) do
	@barvis.profile.images.create(image: File.open(File.join(Rails.root, '/spec/fixtures/files/logo.png')))
end

Then(/^I should have an image$/) do
	expect(@barvis.profile.images.count).to eq 1
end
