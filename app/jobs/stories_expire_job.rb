class StoriesExpireJob < ApplicationJob
    queue_as :default
    def perform(number, user)
      user.stories.find(number).destroy
    end
  end
  