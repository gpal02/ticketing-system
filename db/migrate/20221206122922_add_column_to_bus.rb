class AddColumnToBus < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :total_seats, :integer, default: 60
    add_column :buses, :alloted_seats, :integer, default: 0
  end
end
