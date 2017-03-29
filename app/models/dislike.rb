class Dislike < ApplicationRecord
  has_many :users
  has_many :stocks

end
