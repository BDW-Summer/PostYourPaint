class CreatePaints < ActiveRecord::Migration
  def change
    create_table :paints do |t|
      t.string :color_family
      t.string :name
      t.string :hex
      t.boolean :available
      t.integer :location
      t.integer :quantity
      t.text :additional_info
      t.integer :user_id

      t.timestamps
    end
    add_index :paints, [:user_id, :created_at]
  end
end
