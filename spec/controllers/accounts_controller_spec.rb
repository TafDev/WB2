class StripeSubscriber
	attr_accessor :id
end
RSpec.describe AccountsController do
	before do
		@request.env["devise.mapping"] = Devise.mappings[:user]
		@current_user = create(:user)
		sign_in @current_user
	end

	it "user can become premium" do
		subscriber = object_double(StripeSubscriber.new, id: "0001")
		expect(Stripe::Customer).to receive(:create).and_return(subscriber)
		put :update, {
				user_id: @current_user.id,
				stripeToken: "123456"
		}
	end
end
