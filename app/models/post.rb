class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: {minimum:5 , maximum: 100}
  validates :title, presence: true, length: {minimum:5 , maximum: 500}
end
