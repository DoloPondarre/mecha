class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.integer :payment_method
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :province
      t.boolean :shipping

      t.timestamps
    end
  end
end
