class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.string :commenter
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
