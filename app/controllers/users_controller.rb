class UsersController < ApplicationController
	def update
		@user = User.find_by(id: [params[:id]])
		@user.update(image: params[:image])
		respond_to do |format|
			format.json{ render :json => @user }
		end
	end
end
