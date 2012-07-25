class AddColorFamilyToPaints < ActiveRecord::Migration
  def change
    add_column :paints, :family_id, :int

  end
end
