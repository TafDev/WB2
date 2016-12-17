class Search < ApplicationRecord
	def get_profiles
		profiles = Profile.all
		profiles = Sport.find(sport).profiles if sport.present?
		profiles = Profile.where("county = ?", county) if county.present?
		profiles = Profile.where("gender = ?", gender) if gender.present?
		profiles = Profile.where('f_level = ?', f_level) if f_level.present?
		profiles = Profile.where('age <= ?', max_age) if max_age.present?
		profiles = Profile.where('age >= ?', min_age) if min_age.present?

		profiles
	end
end
