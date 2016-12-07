require 'rails_helper'

RSpec.describe User do
	describe "User" do
		let(:barvis) {create(:user)}

		it "should have a profile" do
			expect(barvis.profile).to be_truthy
		end

		it "should have an account" do
			expect(barvis.account).to be_truthy
		end
	end
end