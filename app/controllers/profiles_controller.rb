class ProfilesController < ApplicationController

	before_action :find_user, only: [:show, :update]
	def index

	end

	def show
		@profile = @user.profile
		@sport = @profile.sports.new
	end

	def update
		@profile = @user.profile
		if params.include?(:sport)
			if params[:sport][:name]
				arr = params[:sport][:name].split(",").map(&:strip)
				sports = arr.inject([]) do |sports, sport_name|
					sport = Sport.find_or_create_by!(name: sport_name)
					@profile.profile_sports.find_or_create_by!(sport_id: sport.id)
					sports << sport
				end
				render json: {sports: sports}
				# render component: 'Sports', props: { sports: sports }

			end
		else
			@profile.update(profile_params)
			render json: @profile
		end
	end


	def destroy
		@sport = current_user.profile.profile_sports.find_by(:sport_id => params[:id])
		@sport.destroy
		render json: @sport
	end

	private

	def find_user
		@user = User.find_by(id: params[:user_id])
	end

	def profile_params
		params.require(:profile).permit(:description, :gender, :age, :f_level)
	end
end
