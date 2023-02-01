class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :correct_image_type
  after_create :expire_job

  def expire_job
    StoriesExpireJob.set(wait: 24.hours).perform_later(id, user.id)
  end
 

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, 'must be jpeg and png')
    elsif image.attached? == false
      errors.add(:image, 'must have an image attached')
    end
  end
end
