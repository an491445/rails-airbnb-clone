class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :minivan, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
