class VetrinaProductsController < ApplicationController
  def index
    @categories = Productcategory.order(:name)
  end
end
