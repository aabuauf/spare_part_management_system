class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :tag_no
      t.string :manufacture
      t.integer :factory_id

      t.timestamps
    end
  end
end
