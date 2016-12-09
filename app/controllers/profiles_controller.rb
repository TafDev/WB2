class ProfilesController < ApplicationController
	def index

	end

	def show
		@user = User.find_by(id: params[:user_id])
	end
end
