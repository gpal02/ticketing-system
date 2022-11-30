class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :seat
      t.integer :number_of_passenger
      t.string :passenger_name
      t.integer :passenger_age
      t.string :passenger_contact

      t.timestamps
    end
  end
end
