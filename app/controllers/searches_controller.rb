class SearchesController < ApplicationController
	def index
		@profiles = Profile.all.order("created_at DESC")
		@search = Search.new
	end


	def create
		@search = Search.create!(search_params)
		respond_to do |f|
			f.js
		end
	end

	private

	def search_params
		params.require(:search).permit(:sport, :gender, :f_level, :min_age, :max_age, :county)
	end
end
