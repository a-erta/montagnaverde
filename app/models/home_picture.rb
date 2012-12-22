class HomePicture < ActiveRecord::Base
  attr_accessible :attachment, :title, :description
  has_attached_file :attachment,
                    :url => "/assets/home_pic/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/home_pic/:id/:style/:basename.:extension",
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
