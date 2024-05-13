class Cart < ApplicationRecord
    attr_reader :items

    def initialize(items = [])
      @items = items
    end
  
    def add_item(product)
      item = @items.find { |item| item.product_id == product.id }
  
      if item
        item.quantity += 1
      else
        @items << CartItem.new(product)
      end
    end
  
    def total
      @items.sum(&:subtotal)
    end
  
    def empty?
      @items.empty?
    end
end