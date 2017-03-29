class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true

  has_secure_password

  has_many :comments
  has_many :stock_users
  has_many :stocks, through: :stock_users
  has_many :likes
  has_many :dislikes


  has_and_belongs_to_many :friends,
    class_name: "User",
    join_table: :friends,
    foreign_key: :user_id,
    association_foreign_key: :friend_id

end
