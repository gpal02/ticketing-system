class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_number
      t.string :source
      t.string :destination
      t.date :date
      t.time :time
      t.string :bus_type
      t.integer :manager_id

      t.timestamps
    end
  end
end
