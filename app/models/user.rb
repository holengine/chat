class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create_commit { broadcast_prepend_to("online_users", target: "online-users") }
  after_update_commit { broadcast_replace_to("online_users") }
  after_destroy_commit { broadcast_remove_to("online_users") }

  def online?
    status == "online"
  end

  def offline?
    !online?
  end
end
