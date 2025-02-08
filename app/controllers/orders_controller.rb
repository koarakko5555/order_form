class OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def confirm
        @order = Order.new(order_params)

        return render :new if @order.invalid?
    end

    def create
        @order = Order.new(order_params)
        return render :new if params[:button] == 'back'
        if @order.save
            session[:order_id] = @order.id
            return redirect_to complete_orders_url
        end
        render :confirm
    end

    def complete
        @order = Order.find_by(id: session[:order_id])
        return redirect_to new_order_url if @order.blank?

        session[:order_id] = nil
    end

    private

    def order_params
        params
            .require(:order)
            .permit(:name,
                    :email,
                    :telephone,
                    :delivery_address)
    end
end