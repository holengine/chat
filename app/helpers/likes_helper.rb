module LikesHelper
  def likes(message, user)
    likes = "#{message.likes_count}" if message.likes_count.positive?
    heart = message.likes.find_by(user: user).present? ? ' ❤️ ' : ' 🤍 '

    "#{likes} #{heart}"
  end
end