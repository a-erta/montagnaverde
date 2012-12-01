class CreateProductcategories < ActiveRecord::Migration
  def change
    create_table :productcategories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
