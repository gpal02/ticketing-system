class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :number_of_passenger
      t.decimal :price
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :bus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
