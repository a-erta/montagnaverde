class VetrinaProductsController < ApplicationController
  def index
    @categories = Productcategory.order(:name)
    @cart = current_cart
  end
end
