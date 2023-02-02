class Friendrequest < ApplicationRecord
    belongs_to :sending_user, class_name: 'User'
    belongs_to :receiving_user, class_name: 'User'
  
    def self.delete_request(sender_id, receiver_id)
      Request.find_by(sending_user_id: sender_id, receiving_user_id: receiver_id).destroy
    end
end
