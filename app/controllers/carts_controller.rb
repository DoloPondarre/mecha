class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def create
    @cart = Cart.create
    session[:cart_id] = @cart.id
    redirect_to @cart
  end

end
