require 'rails_helper'

	describe "User" do

		let(:barvis) {create(:user)}

		# it "should successfully create a user" do
		# 	expect(User.all.count).to eq(1)
		# 	expect(User.find_by(username: "Barvis")).to be_truthy
		# end

		it "should have a profile" do
			expect(barvis.profile).to be_truthy
		end

		it "should have an account" do
			expect(barvis.account).to be_truthy
		end

		it "should have a unique username" do
			@barvis = User.create(username: "Barvis",email: "barvis@test.com", password: "123456")
			@user = User.new(username: "Barvis", email: "barvis1@test.com", password: "123456")
			@user.valid?
			expect(@user.errors[:username]).to include("has already been taken")
		end
	end



