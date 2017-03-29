class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :company_name
      t.float :last_price, :default => 0.00
      t.timestamps
    end
  end
end
