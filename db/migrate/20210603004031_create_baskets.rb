class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets do |t|
      t.string :trans_id
      t.string :item_name
      t.float :item_price
      t.integer :item_quantity
      t.float :tax_amount
      t.float :item_calculated_amount
      t.string :item_calculated_tax_amount
      t.boolean :food_or_medical
      t.boolean :imported

      t.timestamps
    end
  end
end
