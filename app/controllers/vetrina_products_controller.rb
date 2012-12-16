class VetrinaProductsController < ApplicationController
  skip_before_filter :authorize

  def index
    @categories = Productcategory.order(:name)
    @cart = current_cart
  end
end
