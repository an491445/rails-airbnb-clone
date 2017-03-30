class AddToMinivans < ActiveRecord::Migration[5.0]
  def change
    remove_column :minivans, :capacity
    remove_column :minivans, :price_per_day
    remove_column :minivans, :latitude
    remove_column :minivans, :longitude
    remove_column :minivans, :address
    remove_column :minivans, :city
    remove_column :minivans, :zipcode
    remove_column :minivans, :country
    add_column :minivans, :departure_city, :string
    add_column :minivans, :arrival_city, :string
    add_column :minivans, :departure_longitude, :float
    add_column :minivans, :arrival_longitude, :float
    add_column :minivans, :departure_latitude, :float
    add_column :minivans, :arrival_latitude, :float
    add_column :minivans, :available_seats, :integer
    add_column :minivans, :departure_date, :datetime
    add_column :minivans, :arrival_date, :datetime
    add_column :minivans, :price, :integer
    add_column :minivans, :tagline, :text
  end
end
