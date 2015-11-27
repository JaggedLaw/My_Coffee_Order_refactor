class OrdersController < ApplicationController

  def create
     @order = Order.new(quantity: params[:quantity] , sum: params[:sum] )
     if @order.save && current_user
       current_user.orders << @order
       @order.add_items_to_order(@cart, current_user)
       @order.ordered!

      # SendMessage.text
       redirect_to orders_path
     else
       flash[:login] ="Must Login"
       redirect_to login_path
     end
  end

  def index
    if current_user
      @orders = current_user.orders
       flash.now[:order] = "Order was succefully placed"
    else
      flash[:login] ="Must Login"
      redirect_to login_path
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
