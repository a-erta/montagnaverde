class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, :dependent => :destroy
  
  def add_product(price_id)
	current_item = line_items.find_by_price_id(price_id)
	if current_item
		current_item.quantity += 1
	else
		current_item = line_items.build(:price_id => price_id)
	end
	current_item
  end
  
  def total_price
	line_items.to_a.sum { |item| item.total_price }
  end
  
  def products_available
    line_items.each do |item|
      if item.price.product.quantity <= item.quantity
          return false
      end
	end
	  return true
  end
  
  def products_update
    line_items.each do |item|
      item.price.product.update_attributes(:quantity => item.product.quantity -= item.quantity )
    end
  end
  
end
