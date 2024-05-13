class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  
  def index
    @products = Product.where(available: true)
  end

  def show
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end
  
end
