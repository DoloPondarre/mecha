class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :toggle_availability, :toggle_featured]

  def index
    @products = Product.all
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
    if product_params[:remove_images].present?
      product_params[:remove_images].each do |image_id|
        image = @product.images.find_by_id(image_id)
        image.purge if image
      end
    end

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

  def toggle_availability
    @product.toggle!(:available)
    if !@product.available
      @product.update(featured: false) # Desmarca como destacado si se hace no disponible
    end
    redirect_to admin_products_path, notice: "Product availability toggled successfully."
  end

  def toggle_featured
    if @product.featured
      @product.update(featured: false)
    else
      if Product.where(featured: true).count >= 3
        redirect_to admin_products_path, alert: "You can only have up to 3 featured products."
        return
      else
        @product.update(featured: true)
      end
    end
    redirect_to admin_products_path, notice: "Product featured status toggled successfully."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :color, :size, :available, :featured, images: [], remove_images: [])
  end
end
