class CreateShoppingCart < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.string transaction_id
      t.double item_price
      t.integer item_quantity
      t.double tax_amount
      t.double item_calculated_amount
      t.double item_calculated_tax_amount
      t.string foud_or_medical
      t.string imported
      t.timestamps
    end
  end
end
