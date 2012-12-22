class Product < ActiveRecord::Base
  attr_accessible :description, :image, :price, :title, :quantity, :category_id, :home
  validates :title, :description, :image, :quantity, :category_id, :home, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0}  
  validates :title, :uniqueness => true
  has_attached_file :image,
                    :url => "/assets/product_img/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/product_img/:id/:style/:basename.:extension",
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :prices
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
  
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, 'Line Items present')
  		return false
  	end
  end
end
