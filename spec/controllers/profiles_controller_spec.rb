require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
	describe "Profile" do
		before do
			@bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
			@alice = User.create!(username: "Alice", email: "alice@alice.net", password: "123456", password_confirmation: "123456")
			@mark = User.create!(username: "Mark", email: "mark@mark.net", password: "123456", password_confirmation: "123456")

		@bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
		@alice.profile.update(:gender => "Female", :f_level => "Beginner", :age => 47, :county => "London", :description => "I am just me")
		@mark.profile.update(:gender => "Male", :f_level => "Intermediate", :age => 16, :county => "Broxbourne", :description => "I am also amazing!")


		end

		it "should belong to a user" do
			expect(@bob.profile).to be_truthy
		end

		it "should allow user to add sports" do
			@bob.profile.sports.create(name: "football")
			expect(@bob.profile.sports.count).to eq 1
		end

		it "should allow user to add multiple sports" do
			@bob.profile.sports.create(name: "basketball")
			@bob.profile.sports.create(name: "hockey")
			expect(@bob.profile.sports.count).to eq 2
		end
		
		it "should allow user to delete a sport from their profile" do
			@bob.profile.sports.create(name: "basketball")
			@bob.profile.sports.create(name: "hockey")
			@sport = @bob.profile.profile_sports.last
			@sport.destroy
			expect(@bob.profile.sports.count).to eq 1
			expect(Sport.all.count).to eq 2
		end
	end
end
