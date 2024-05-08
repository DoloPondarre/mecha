class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.string :color
      t.string :size
      t.boolean :available

      t.timestamps
    end
  end
end
