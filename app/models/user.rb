class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_one_attached :image
  has_many :stories, dependent: :destroy

  validate :correct_image_type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :send_requests, foreign_key: :send_user_id, class_name: 'friendrequest', dependent: :destroy
  has_many :receive_users, through: :send_requests

  has_many :receive_requests, foreign_key: :receive_user_id, class_name: 'friendrequest', dependent: :destroy
  has_many :sending_users, through: :receiving_requests

  has_many :following_follows, foreign_key: :following_user_id, class_name: 'Follower', dependent: :destroy                                                                                                                                                                            
  has_many :followed_users, through: :following_follows, dependent: :destroy
                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  has_many :followed_follows, foreign_key: :followed_user_id, class_name: 'Follower', dependent: :destroy
  has_many :followed_users, through: :followed_follows, dependent: :destroy


  validates :username, presence: true, length: {minimum:5 , maximum: 20}
  validates :username, presence: true, length: {minimum:5 , maximum: 20}
  validates :username, presence: true, length: {minimum:5 , maximum: 20}

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, ' must be jpeg and png')
    elsif image.attached? == false
      errors.add(:image, 'must have an image attached')
    end
  end


  
end
