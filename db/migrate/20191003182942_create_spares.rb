class CreateSpares < ActiveRecord::Migration[6.0]
  def change
    create_table :spares do |t|
      t.string :code
      t.string :description
      t.string :manufacture
      t.string :part_no
      t.integer :qty
      t.integer :factory_id

      t.timestamps
    end
  end
end
