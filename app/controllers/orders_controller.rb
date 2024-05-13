class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart = current_cart

    @cart.cart_items.each do |item|
      @order.order_items.build(product: item.product)
    end
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_whatsapp_path(@order)
    else
      render :new
    end
  end

  def whatsapp
    @order = Order.find(params[:id])
    @message = "¡Nuevo Pedido!\n\n"
    @message += "Nombre: #{@order.name} #{@order.last_name}\n"
    @message += "Forma de pago: #{Order.payment_methods[@order.payment_method]}\n"
    if @order.shipping
      @message += "Dirección de envío: #{@order.address}, #{@order.city}, #{@order.province}, #{@order.postal_code}"
    else
      @message += "Recoger en tienda"
    end
    @message += "\nProductos:\n"
    @order.order_items.each do |item|
      @message += "- #{item.product.name}\n"
    end

    send_whatsapp_message(@message)
    redirect_to root_path, notice: 'Pedido enviado correctamente.'
  end

  private

  def order_params
    params.require(:order).permit(:name, :last_name, :phone, :payment_method, :address, :postal_code, :city, :province, :shipping)
  end

  def send_whatsapp_message(message)
    # Aquí debes reemplazar 'XXXXXXXXXXXXX' con tu número de WhatsApp, incluyendo el código de país.
    whatsapp_number = '+5492216071689'
    url = "https://api.whatsapp.com/send?phone=#{whatsapp_number}&text=#{URI.encode(message)}"
    redirect_to url
  end

end
