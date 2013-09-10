class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @orders = Order.all
    @order = Order.new
  end


  # POST /orders
  # POST /orders.json
  def create
    @orders = Order.all
    @order = Order.new(order_params)
    @order.card = params[:stripeToken]
    @order.amount_in_cents = @order.amount * 100
      if @order.save_with_payment
        redirect_to @order
      else
        render action: "new", error: "There was a problem. Please try again."
      end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:amount, :email, :card, :stripeToken, :f_name, :l_name, :anonymous, :charity)
    end
end
