class AddColumnUserIdAndRoomIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :user_id, :integer, null: false
    add_index :reservations, :user_id
    add_column :reservations, :room_id, :integer, null: false
    add_index :reservations, :room_id
  end
end
