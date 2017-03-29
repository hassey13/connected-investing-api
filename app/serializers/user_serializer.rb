class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :email, :avatar, :id

  has_many :stocks, through: :stock_users
  has_many :friends, through: :friends
  has_many :likes
  has_many :dislikes
end
