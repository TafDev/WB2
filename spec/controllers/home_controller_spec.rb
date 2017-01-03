require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	include Warden::Test::Helpers

	describe "Redirects" do
		let(:barvis) {create(:user)}

		it "displays index page" do
			get :index
			expect(response.status).to be 302
		end

		it "redirect to user profile page upon login" do
			sign_in barvis
			get :index
			expect(response.status).to be 302
		end
	end
end
