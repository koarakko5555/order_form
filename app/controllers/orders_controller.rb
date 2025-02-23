class OrdersController < ApplicationController
    def new
        @order = Order.new
        @order.order_products.build
    end

    def confirm
        @order = Order.new(order_params)
        if params.key?(:add_product)
            @order.order_products << OrderProduct.new
            return render :new
        end

        if params.key?(:delete_product)
            filter_order_products
            return render :new
        end

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
                    :delivery_address,
                    :payment_method_id,
                    :other_comment,
                    :direct_mail_enabled,
                    inflow_source_ids: [],
                    order_products_attributes: %i[product_id quantity])
    end

    def filter_order_products
        @order.order_products = @order.order_products
                                      .reject
                                      .with_index { |_, index| index == params[:delete_product].to_i }
    end
end