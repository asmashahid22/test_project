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

  validates :username, presence: true
  validates :firstname, format: { with: /\A[a-zA-Z]+\z/,
                                  message: 'only allows letters' }
  validates :lastname, format: { with: /\A[a-zA-Z]+\z/,
                                 message: 'only allows letters' }

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, ' must be jpeg and png')
    elsif image.attached? == false
      errors.add(:image, 'must have an image attached')
    end
  end


  
end
