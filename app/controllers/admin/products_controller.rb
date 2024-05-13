class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all()
    @available_products = Product.where(available: true)
    @unavailable_products = Product.where(available: false)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    # Eliminar imágenes seleccionadas si es necesario
    if product_params[:remove_images].present?
      product_params[:remove_images].each do |image_id|
        image = @product.images.find_by_id(image_id)
        image.purge if image
      end
    end

    # Agregar nuevas imágenes si se enviaron
    if product_params[:images].present?
      @product.images.attach(product_params[:images])
    end

    respond_to do |format|
      if @product.update(product_params.except(:remove_images, :images))
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end  

  def make_unavailable
    @product = Product.find(params[:id])
    @product.update(available: false)
    redirect_to admin_products_path
  end

  def make_available
    @product = Product.find(params[:id])
    @product.update(available: true)
    redirect_to admin_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :color, :size, :available, images: [], remove_images: [])
  end
  
end
