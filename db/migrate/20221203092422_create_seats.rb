class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :bus_seats, null: false
      t.references :bus, null: false, foreign_key: true

      t.timestamps
    end
  end
end