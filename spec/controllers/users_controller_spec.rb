require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	include Warden::Test::Helpers

	describe "User update" do
		let(:barvis) {create(:user)}

		before do
			@image = File.new(Rails.root + 'spec/fixtures/files/steve.jpg')
			sign_in barvis
		end

		it "should allow user change image" do
			patch :update, params: {id: barvis.id, image: @image}, format: :json
			expect(response.body).to include "File"
		end
	end
end
