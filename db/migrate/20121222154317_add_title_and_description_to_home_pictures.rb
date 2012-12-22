class AddTitleAndDescriptionToHomePictures < ActiveRecord::Migration
  def change
    add_column :home_pictures, :title, :string
    add_column :home_pictures, :description, :text
  end
end
