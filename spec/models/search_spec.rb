require 'rails_helper'

RSpec.describe Search, type: :model do
  describe "Search" do
	  before do
		  @bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
		  @alice = User.create!(username: "Alice", email: "alice@alice.net", password: "123456", password_confirmation: "123456")
		  @mark = User.create!(username: "Mark", email: "mark@mark.net", password: "123456", password_confirmation: "123456")

		  @profile1 = @bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
		  @profile2 = @alice.profile.update(:gender => "Female", :f_level => "Beginner", :age => 47, :county => "London", :description => "I am just me")
		  @profile3 = @mark.profile.update(:gender => "Male", :f_level => "Intermediate", :age => 16, :county => "Broxbourne", :description => "I am also amazing!")
	  end


	  it "should find all users where the gender is male" do
		  @search = Search.create!(gender: "Male")
			result = @search.get_profiles
			expect(result.count).to eq 2
	  end

	  it "should find users by fitness level" do
		  @search = Search.create!(f_level: "Expert")
		  result = @search.get_profiles
		  expect(result.map(&:user)).to include(@bob)
		  expect(result.count).to eq 1
	  end

	  it "should find users by county" do
		  @search = Search.create!(county: "Broxbourne")
		  result = @search.get_profiles
		  expect(result.map(&:user)).to include(@mark)
		  expect(result.map(&:user)).to include(@bob)
		  expect(result.count).to eq 2
	  end

	  it "should find users by age" do
		  @search = Search.create!(min_age: 47)
		  result = @search.get_profiles
		  expect(result.map(&:user)).to include(@alice)
		  expect(result.count).to eq 1
	  end
  end
end
