class OrdersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart
    if @cart.line_items.empty?
    redirect_to store_url, :notice => "Your cart is empty"
    return
    end
    
    # check if the product are available
    if @cart.products_available == true
      @order = Order.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @order }
      end
    else
       Cart.destroy(session[:cart_id])
	   session[:cart_id] = nil
       redirect_to store_url, :notice => t(:product_not_available)
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @cart = current_cart
    if @cart.products_available == true
      @order = Order.new(params[:order])
	  @order.add_line_items_from_cart(current_cart)
	  
      respond_to do |format|
        if @order.save
          # update quantity
          @cart.products_update
          Cart.destroy(session[:cart_id])
	  	    session[:cart_id] = nil
		  # Re-enable email on production
		      OrderNotifier.received(@order).deliver
          format.html { redirect_to store_url, :notice => t(:thanks) }
          format.json { render :json => @order, :status => :created, :location => @order }
        else
          @cart = current_cart
          format.html { render :action => "new" }
          format.json { render :json => @order.errors, :status => :unprocessable_entity }
        end
      end
    else
      Cart.destroy(session[:cart_id])
	  session[:cart_id] = nil
      redirect_to store_url, :notice => t(:product_not_available)
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
	
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end