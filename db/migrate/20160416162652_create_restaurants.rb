class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :address
      t.string :twitter
      t.string :website
      t.string :hours

      t.timestamps null: false
    end
  end
end
