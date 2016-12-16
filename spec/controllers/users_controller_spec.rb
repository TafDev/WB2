require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before do
		ProfileSport.destroy_all
		Profile.destroy_all
		User.destroy_all
		@image = File.new(Rails.root + 'spec/fixtures/files/steve.jpg')
	end

	describe "User update" do

		let(:barvis) {create(:user)}
		before do
			process :update, method: :patch, params: {id: barvis.id, image: @image}
		end


		it "should allow user change image" do
			barvis.update(image: @image)
			expect(barvis.image).to be_truthy
		end
	end
end

