class SearchesController < ApplicationController
	def index
		# binding.pry
		@profiles = Profile.all.order("created_at DESC")
		@search = Search.new

	end


	def create
		# binding.pry
		@search = Search.create!(search_params)
		# redirect_to @search
		respond_to do |format|
			format.js
		end
	end

	def show
		@search = Search.find(params[:id])
	end
	private

	def search_params
		params.require(:search).permit(:sport, :gender, :f_level, :min_age, :max_age)
	end
end
