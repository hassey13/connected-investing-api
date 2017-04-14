class CreateUserInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_investments do |t|
      t.integer :user_id
      t.integer :stock_id
      t.string :action
      t.integer :quantity
      t.float :price
      t.timestamps
    end
  end
end
