class Sport < ApplicationRecord
	has_many :profile_sports
	has_many :profiles, through: :profile_sports
end
