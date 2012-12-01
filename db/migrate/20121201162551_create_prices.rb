class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :quantity
      t.string :measure

      t.timestamps
    end
  end
end
