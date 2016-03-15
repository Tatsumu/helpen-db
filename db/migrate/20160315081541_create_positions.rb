class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.decimal  "lat",   precision: 16, scale: 13
      t.decimal  "long",  precision: 16, scale: 13
      t.string  "name", null: false
      t.string  "mail", null: false
      t.string  "password", null: false

      t.timestamps null: false
    end
  end
end
