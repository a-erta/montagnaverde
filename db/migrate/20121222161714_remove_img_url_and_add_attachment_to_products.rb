class RemoveImgUrlAndAddAttachmentToProducts < ActiveRecord::Migration
  def up
    add_attachment :products, :image
    remove_column :products, :image_url
  end

  def down
    remove_attachment :products, :image
    add_column :products, :image_url
  end
end
