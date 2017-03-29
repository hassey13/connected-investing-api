class Stock < ApplicationRecord
  has_many :stock_users
  has_many :users, through: :stock_users

  has_many :likes
  has_many :dislikes

end
