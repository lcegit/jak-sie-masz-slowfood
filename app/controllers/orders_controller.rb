class OrdersController < ApplicationController
  before_action :get_product, only: [:create, :update]

  def create
    order = Order.create
    order.add(@product, @product.price)
    if order.persisted?
      session[:order_id] = order.id
      redirect_back_with_notice
    end
  end

  def update
    order = Order.find(session[:order_id])
    order.add(@product, @product.price)
    if order.persisted?
      redirect_back_with_notice
    end
  end

  private

  def get_product
    @product = Product.find(params[:product])
  end

  def redirect_back_with_notice
    redirect_back(fallback_location: root_path, notice: "#{@product.name} has been added to your order")
  end
end
