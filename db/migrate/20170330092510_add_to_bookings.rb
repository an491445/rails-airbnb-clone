class AddToBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :start_time
    remove_column :bookings, :end_time
    remove_column :bookings, :price
    add_column :bookings, :message, :text
  end
end
