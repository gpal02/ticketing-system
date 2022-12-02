class CreatePassengerInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :passenger_informations do |t|
      t.string :passenger_name
      t.integer :passenger_age
      t.string :passenger_contact
      t.belongs_to :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
