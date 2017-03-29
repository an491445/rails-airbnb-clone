class AddAddressToMinivans < ActiveRecord::Migration[5.0]
  def change
    add_column :minivans, :address, :string
    remove_column :minivans, :location, :string
    add_column :minivans, :city, :string
    add_column :minivans, :country, :string
    add_column :minivans, :zipcode, :string
  end
end
