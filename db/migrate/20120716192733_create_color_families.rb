class CreateColorFamilies < ActiveRecord::Migration
  def change
    create_table :color_families do |t|
      t.string :family

      t.timestamps
    end
  end
end
