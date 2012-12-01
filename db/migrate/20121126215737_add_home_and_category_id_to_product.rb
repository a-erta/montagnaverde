class AddHomeAndCategoryIdToProduct < ActiveRecord::Migration
  def change
    change_column :products, :category_id, :string
  end
end
