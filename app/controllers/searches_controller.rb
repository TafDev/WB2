class SearchesController < ApplicationController
	def index
		@profiles = Profile.all.order("created_at DESC")
		@search = Search.new

	end


	def create
		@search = Search.create!(search_params)
		respond_to do |format|
			format.js
		end
	end

	def show
		@search = Search.find(params[:id])
	end
	private

	def search_params
		params.require(:search).permit(:sport, :gender, :f_level, :min_age, :max_age, :county)
	end
end
