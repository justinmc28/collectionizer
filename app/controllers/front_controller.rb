class FrontController < ApplicationController
  def index
     @order = Order.new
     @orders = Order.all     
  end
end
