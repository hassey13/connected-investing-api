class AddSocialDataToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :likes, :integer, :default => 0
    add_column :stocks, :dislikes, :integer, :default => 0
  end
end
