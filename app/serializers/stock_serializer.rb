class StockSerializer < ActiveModel::Serializer
  attributes :ticker, :company_name, :last_price

  has_many :users, through: :stock_users
  has_many :likes
  has_many :dislikes
end
