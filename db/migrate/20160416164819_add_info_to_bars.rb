class AddInfoToBars < ActiveRecord::Migration
  def change
    add_column :bars, :name, :string
    add_column :bars, :email, :string
    add_column :bars, :password, :string
    add_column :bars, :address, :string
    add_column :bars, :twitter, :string
    add_column :bars, :website, :string
    add_column :bars, :hours, :string
  end
end
