class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :checkout_date
      t.integer :guests_count
      t.integer :total_amount

      t.timestamps
    end
  end
end
