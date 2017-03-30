class ModifyLocationColumnsInMinivans < ActiveRecord::Migration[5.0]
  def change
    remove_column :minivans, :departure_city
    remove_column :minivans, :arrival_city
    remove_column :minivans, :departure_latitude
    remove_column :minivans, :departure_longitude
    remove_column :minivans, :arrival_latitude
    remove_column :minivans, :arrival_longitude

    add_reference :departures, :minivan, index: true, foreign_key: true
    add_reference :arrivals, :minivan, index: true, foreign_key: true
  end
end
