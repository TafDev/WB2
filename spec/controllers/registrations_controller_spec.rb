require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
		before do
			User.destroy_all
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@current_user = create(:user)
			sign_in @current_user
		end

		describe "User registration" do
			before do
				# post '/users/sign_up'

				# process :create, method: :post, params: {
				# 		sign_up: {username: "Barvis",
				# 		          email: "barvis@test.com",
				# 		          password: "123456",
				# 		          password_confirmation: "123456"
				# 		}
				# }
			end

			it "should successfully create a user" do
				expect(User.all.count).to eq(1)
				expect(User.find_by(username: "Barvis")).to be_truthy
			end

			it "Should return status 200" do
				expect(response.status).to eq(200)
			end

			it "should create a user profile when user signs up" do
				expect(User.last.profile).to be_truthy
			end

			it "should create a user account when user signs up" do
				expect(User.last.account).to be_truthy
			end
		end
end
