class AddHomeAndCategoryIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :integer
    change_column :products, :category_id, :string
  end
end
