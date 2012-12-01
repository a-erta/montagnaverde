class ChangeLineItemsColumnName < ActiveRecord::Migration
  def change
    rename_column :line_items, :product_id, :price_id
  end
end
