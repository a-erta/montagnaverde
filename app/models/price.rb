class Price < ActiveRecord::Base
  attr_accessible :measure, :price, :product_id, :quantity
  validates :measure, :price, :product_id, :quantity, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0}

  belongs_to :product
  has_many :line_items

end
