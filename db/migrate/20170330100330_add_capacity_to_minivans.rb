class AddCapacityToMinivans < ActiveRecord::Migration[5.0]
  def change
     add_column :minivans, :capacity, :integer
  end
end
