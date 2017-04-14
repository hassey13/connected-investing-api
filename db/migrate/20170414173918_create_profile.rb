class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profile do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.text :bio, :default => "I am an awesome person!"
      t.integer :cash, :default => 10000.00
      t.timestamps
    end
  end
end
