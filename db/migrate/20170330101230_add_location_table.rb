class AddLocationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :departures do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.timestamps
    end

    create_table :arrivals do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
