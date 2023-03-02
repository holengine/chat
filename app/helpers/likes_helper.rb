module LikesHelper
  def likes(message)
    likes = "#{message.likes_count}" if message.likes_count.positive?
    heart = message.likes.find_by(user: current_user).present? ? ' ❤️ ' : ' 🤍 '

    "#{likes} #{heart}"
  end
end