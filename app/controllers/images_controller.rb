class ImagesController < ApplicationController

	before_action :find_user

	def index
		@images = @user.profile.images unless @user.profile.images.nil?
	end

	def create
		@image = current_user.profile.images.create(image: params[:file])
		Cloudinary::Uploader.upload(params[:file])
		if @image.save!
			respond_to do |format|
				format.json{ render :json => @image }
			end
		end
	end

	def show
		if params[:file].present?
			preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
			raise "Invalid upload signature" if !preloaded.valid?
			@model.image_id = preloaded.identifier
		else
		@images = @user.profile.images unless @user.profile.images.nil?
		# respond_to do |format|
		# 	format.json{ render :json => @media }
		# end
			end
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		render json: @image
	end

	private

	def find_user
		@user = User.find_by(id: params[:user_id])
	end
end
