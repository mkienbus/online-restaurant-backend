class ChangeReservationDateToString < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :reservation_date, :string
  end
end
