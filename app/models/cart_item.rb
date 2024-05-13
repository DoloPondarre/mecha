class CartItem < ApplicationRecord
  attr_reader :product, :quantity

  def initialize(product, quantity = 1)
    @product = product
    @quantity = quantity
  end

  def subtotal
    @product.price * @quantity
  end
end
