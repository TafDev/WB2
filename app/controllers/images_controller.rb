class ImagesController < ApplicationController

	before_action :find_user

	def create
		@image = current_user.profile.images.create(image: params[:file])
		# @image = Image.new(image: params[:file])
		if @image.save!
			respond_to do |format|
				format.json{ render :json => @image }
			end
		end
	end

	def show
		@images = @user.profile.images unless @user.profile.images.nil?
		# respond_to do |format|
		# 	format.json{ render :json => @media }
		# end
	end

	private

	def find_user
		@user = User.find_by(id: params[:user_id])
	end
end
