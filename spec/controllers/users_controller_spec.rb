require 'rails_helper'


RSpec.describe UsersController, type: :controller do
	include Warden::Test::Helpers

	before do
		@image = File.new(Rails.root + 'spec/fixtures/files/steve.jpg')
	end

	describe "User update" do

		let(:barvis) {create(:user)}
		before do
			login_as barvis, scope: :user
			process :update, method: :patch, params: {id: barvis.id, image: @image}
		end

		it "should allow user change image" do
			barvis.update(image: @image)
			expect(barvis.image).to be_truthy
		end
	end
end

