class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :rv_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.float :total_price

      t.timestamps null: false
    end
  end
end
