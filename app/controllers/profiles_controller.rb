class ProfilesController < ApplicationController

	before_action :find_user, only: [:show, :update]
	def index

	end

	def show
		@profile = @user.profile
	end

	def update
		@profile = @user.profile
		@profile.update(profile_params)
		render json: @profile
	end

	private

	def find_user
		@user = User.find_by(id: params[:user_id])
	end

	def profile_params
		params.require(:profile).permit(:description, :gender, :age, :f_level)
	end
end
