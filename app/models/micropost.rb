class Micropost < ApplicationRecord
  belongs_to :user #this associate already includes validation for user_id
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 250 }
  validate :picture_size

  private
    def picture_size
      errors.add(:picture, "should be less than 5mb") if picture.size > 5.megabytes
    end
end
