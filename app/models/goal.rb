class Goal < ApplicationRecord
  belongs_to :profile

  validates :body,
            presence: true
end
