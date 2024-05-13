module ApplicationHelper

    def current_cart
        @current_cart ||= Cart.new(session[:cart] || [])
    end

    def current_cart_items
        current_cart.items
    end

    def current_cart_total
        number_to_currency(current_cart.total)
    end

    def count_cart_items
        current_cart.items.sum(&:quantity)
    end
end
