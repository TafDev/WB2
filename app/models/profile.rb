class Profile < ApplicationRecord
  belongs_to :user
  has_many :images

  GENDER = %w(Male Female Transgender)
	FLEVEL = %w(Beginner Intermediate Expert)
end
