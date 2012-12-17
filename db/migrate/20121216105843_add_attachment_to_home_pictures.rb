class AddAttachmentToHomePictures < ActiveRecord::Migration
  def self.up
    add_attachment :home_pictures, :attachment
  end

  def self.down
    remove_attachment :home_pictures, :attachment
  end
end
