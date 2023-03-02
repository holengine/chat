module LikesHelper
  def likes(message)
    "#{message.likes_count}" if message.likes_count.positive?
  end

  def heart(message, user)
    message.likes.find_by(user: user).present? ? ' ❤️ ' : ' 🤍 '
  end
end