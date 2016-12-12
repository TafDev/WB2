class Profile < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :profile_sports
  has_many :sports, through: :profile_sports

  GENDER = %w(Male Female Transgender)
	FLEVEL = %w(Beginner Intermediate Expert)
end
