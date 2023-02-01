module PostHelper
    def like_check(post)
      post.likes.count == 1 ? 'Like' : 'Likes'
      pre_like = post.likes.find { |like| like.user_id == current_user.id }
      if pre_like
        button_to 'Unlike', post_like_path(post, pre_like), method: :delete, class: 'btn btn-danger'
      else
        button_to 'Like', post_likes_path(post), method: :post, class: 'btn btn-info'
      end
    end
  end
  