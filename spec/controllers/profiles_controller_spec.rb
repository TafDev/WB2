require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
	include Warden::Test::Helpers

	describe "Profile" do
		before do
			@bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
			@alice = User.create!(username: "Alice", email: "alice@alice.net", password: "123456", password_confirmation: "123456")
			@mark = User.create!(username: "Mark", email: "mark@mark.net", password: "123456", password_confirmation: "123456")

			@bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
			@alice.profile.update(:gender => "Female", :f_level => "Beginner", :age => 47, :county => "London", :description => "I am just me")
			@mark.profile.update(:gender => "Male", :f_level => "Intermediate", :age => 16, :county => "Broxbourne", :description => "I am also amazing!")

			sign_in @bob
		end

		it "can view user profile" do
			get :show, params: {user_id: @bob}
			expect(response.status).to be 200
		end

		it "should add sports to profile" do
			process :update, method: :patch,
			      params: {
					      user_id: @bob.id,
					      sport: {
							      name: "Tennis"
					      }
			      }
			expect(@bob.profile.profile_sports.count).to be 1
		end

		it "should add add multiple sports to profile" do
			process :update, method: :patch,
			        params: {
					        user_id: @bob.id,
					        sport: {
							        name: "Tennis, Basketball"
					        }
			        }
			expect(@bob.profile.profile_sports.count).to be 2
		end

		it "should update user age" do
			process :update, method: :patch,
		          params: {
				          user_id: @bob.id,
				          profile: {
						          age: 45
				          }
		          }
			expect(@bob.reload.profile.age).to eq 45
		end

		it "should remove a sport from profile" do
			process :update, method: :patch,
			        params: {
					        user_id: @bob.id,
					        sport: {
							        name: "Tennis, Basketball"
					        }
			        }
			expect(@bob.profile.profile_sports.count).to be 2
			process :destroy, method: :delete,
			        params: {
					        user_id: @bob.id,
				          id: 4
			        }
			expect(@bob.profile.profile_sports.count).to be 1
		end
	end

end
