class AddHomeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :home, :integer
  end
end
