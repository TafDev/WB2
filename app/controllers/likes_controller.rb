class LikesController < ApplicationController
	def create
		like = Like.find_by(like_params.to_h.merge(user_id: current_user.id))
		if like
			like.destroy
			render json: {success: "unliked"}
		else
			like = Like.create(like_params.merge(:user => current_user))
			render json: {success: "liked"}
		end
	end

	private

	def like_params
		params.require(:likable).permit(:likable_type, :likable_id)
	end
end
