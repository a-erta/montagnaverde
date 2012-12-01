class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :price_id
  belongs_to :price
  belongs_to :cart
  belongs_to :order
  
  def total_price
	price.price * quantity
  end
end
