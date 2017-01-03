class Image < ApplicationRecord
  belongs_to :profile
  has_many :likes, as: :likable

  mount_uploader :image, ImagesUploader


end
