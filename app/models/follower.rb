class Follower < ApplicationRecord
    belongs_to :follower_user, class_name: 'User', dependent: :destroy
    belongs_to :following_user, class_name: 'User', dependent: :destroy
end
