class AccountsController < ApplicationController
	before_action :find_user

  def show
  end

  def update

	  # @user = current_user
	  token = params[:stripeToken]
	  subscriber = Stripe::Customer.create(
			  card: token,
			  plan: 1,
			  email: current_user.email
	  )
	  current_user.account.is_premium = true
	  current_user.account.stripeid = subscriber.id
	  current_user.account.save

	  # UserNotifierMailer.send_subscription_email(@user).deliver_later
	  # redirect_to(@user, :notice => 'Thank you')

	  redirect_to user_profile_path(@user)
  end

	private
	def find_user
		@user = User.find_by(id: params[:user_id])
	end
end
