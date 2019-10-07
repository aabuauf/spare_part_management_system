class CreateBoms < ActiveRecord::Migration[6.0]
  def change
    create_table :boms do |t|
      t.integer :equipment_id
      t.integer :spare_id
      t.integer :qty_installed

      t.timestamps
    end
  end
end
