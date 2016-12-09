class Image < ApplicationRecord
  belongs_to :profile
  mount_uploader :image, ImagesUploader


end
