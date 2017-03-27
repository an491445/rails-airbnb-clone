class CreateMinivans < ActiveRecord::Migration[5.0]
  def change
    create_table :minivans do |t|
      t.integer :capacity
      t.integer :model_year
      t.string :gearbox
      t.string :picture
      t.references :user, foreign_key: true
      t.integer :price_per_day
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
