Then(/^I should have a like$/) do
	expect(@barvis.user_likes.count).to eq 1
end

Given(/^I have sample images$/) do
	@mavis.profile.images.create(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'steve.jpg')))
end


