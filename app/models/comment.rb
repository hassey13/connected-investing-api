class Comment < ApplicationRecord
  belongs_to :stock
  has_one :user 
end
