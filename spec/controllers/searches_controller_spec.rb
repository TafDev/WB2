require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
	include Warden::Test::Helpers

	before do
		@bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
		@alice = User.create!(username: "Alice", email: "alice@alice.net", password: "123456", password_confirmation: "123456")
		@mark = User.create!(username: "Mark", email: "mark@mark.net", password: "123456", password_confirmation: "123456")

		@profile1 = @bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
		@profile2 = @alice.profile.update(:gender => "Female", :f_level => "Beginner", :age => 47, :county => "London", :description => "I am just me")
		@profile3 = @mark.profile.update(:gender => "Male", :f_level => "Intermediate", :age => 16, :county => "Broxbourne", :description => "I am also amazing!")

		sign_in @bob
		get :index

	end

	describe "GET #index" do
		it "shows the search index page" do
			expect(response.status).to eq 200
		end
	end

	describe "Create Search" do
		it "should create a new search object upon search" do
			# binding.pry
			process :create, method: :post,
			        params: {
					        search: {
							        gender: "Male",
							        county: "Broxbourne"
					        }
			        },
			        format: :js
			expect(Search.all.count).to eq 1
		end
	end
 end
