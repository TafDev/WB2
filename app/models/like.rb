class Like < ApplicationRecord
	belongs_to :likable, polymorphic: true
	belongs_to :user, inverse_of: :user_likes
end
