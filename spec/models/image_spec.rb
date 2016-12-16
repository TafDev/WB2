require 'rails_helper'

RSpec.describe Image do
	describe "Images" do
		let(:barvis) {create(:user)}
		let(:mavis) {create(:user2)}

		it "should belong to a profile" do
			expect(barvis.profile.images).to be_truthy
		end

		it "should add images to user" do
			user = barvis.profile
			user.images.create(image: File.open(File.join(Rails.root, '/spec/fixtures/files/steve.jpg')))
			expect(user.images.count).to be(1)
		end

		it "should have multiple images" do
			user = barvis.profile
			user.images.create(image: File.open(File.join(Rails.root, '/spec/fixtures/files/steve.jpg')))
			user.images.create(image: File.open(File.join(Rails.root, '/spec/fixtures/files/steve.jpg')))
			expect(user.images.count).to eq(2)
		end
	end
end
