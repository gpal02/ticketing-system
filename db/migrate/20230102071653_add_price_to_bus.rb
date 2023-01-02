class AddPriceToBus < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :price, :decimal
  end
end
