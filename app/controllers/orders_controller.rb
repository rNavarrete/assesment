class OrdersController < ApplicationController
  def index
    @orders = Order.all

  def show
    @order = Order.find(params[:id])
  end
end
