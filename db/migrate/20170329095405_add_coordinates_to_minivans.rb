class AddCoordinatesToMinivans < ActiveRecord::Migration[5.0]
  def change
    add_column :minivans, :latitude, :float
    add_column :minivans, :longitude, :float
  end
end
