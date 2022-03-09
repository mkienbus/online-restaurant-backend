class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user
      t.belongs_to :restaurant
      t.datetime :reservation_date
      
      t.timestamps
    end
  end
end
