require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
	before do
		Profile.destroy_all
		User.destroy_all
		@bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
		@alice = User.create!(username: "Alice", email: "alice@alice.net", password: "123456", password_confirmation: "123456")
		@mark = User.create!(username: "Mark", email: "mark@mark.net", password: "123456", password_confirmation: "123456")

		@profile1 = @bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
		@profile2 = @alice.profile.update(:gender => "Female", :f_level => "Beginner", :age => 47, :county => "London", :description => "I am just me")
		@profile3 = @mark.profile.update(:gender => "Male", :f_level => "Intermediate", :age => 16, :county => "Broxbourne", :description => "I am also amazing!")

	end

	describe "Search" do
		it "should find users by gender" do
			@search = []
			@search << Profile.where(gender: "Male")
			expect(@search[0].size).to eq 2
		end
	end
 end
