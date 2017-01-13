class GoalsController < ApplicationController
	before_action :set_profile


	def create
		unless current_user
			flash[:alert] = "Please sign in or sign up first"
			redirect_to new_user_session_path
		else
			@goal = @profile.goals.build(goal_params)
			@goal.profile.user = current_user
			if @goal.save
				flash[:notice] = "Goal has been created"
			else
				flash.now[:alert] = "Goal has not been created"
			end
		end
		respond_to do |format|
			format.js
			format.json {render json: @goal}
		end
	end

	def update
		@goal = Goal.find(params[:id])
		@goal.update(goal_params)
		respond_to do |format|
			format.json {render json: @goal}
		end
	end

	def destroy
		@goal = Goal.find(params[:id])
		@goal.destroy
		render json: @goal
	end

	private

	def goal_params
		params.require(:goal).permit(:body, :is_complete)
	end


	def set_profile
		user = User.find(params[:user_id])
		@profile = user.profile
	end
end
