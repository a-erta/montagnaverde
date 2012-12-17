class CreateHomePictures < ActiveRecord::Migration
  def change
    create_table :home_pictures do |t|

      t.timestamps
    end
  end
end
