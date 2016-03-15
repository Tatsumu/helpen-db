class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.decimal  "lat",   precision: 16, scale: 13
      t.decimal  "long",  precision: 16, scale: 13
      t.string  "name", null: false
      t.string  "mail", null: false
      t.string  "pin", null: false

      t.timestamps null: false
    end
  end
end
