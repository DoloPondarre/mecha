class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  
  def index
    @products = Product.where(available: true)
  end

  def show
  end

  def search
    query = params[:query].to_s.downcase.strip
    if query.present?
      @products = Product.where('LOWER(name) LIKE :query OR LOWER(description) LIKE :query OR LOWER(color) LIKE :query', query: "%#{query}%")
    else
      @products = Product.all
    end

    respond_to do |format|
      format.html { render :index }
      format.json do
        render json: {
          html: render_to_string(partial: 'products/product_list', locals: { products: @products }, formats: [:html])
        }
      end
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end
end
