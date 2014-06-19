class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def cart
    @categories = Category.order('name asc')
    @current_cart = session[:cart]

    @sub_total = 0.0
    @current_cart.each do |key, value|
      @sub_total = @sub_total + value[2]
    end
    
    @sales_tax = @sub_total * Order::CURRENT_SALES_TAX
    @grand_total = @sales_tax + @sub_total
  end

  # GET /customers
  # GET /customers.json
  def index
    @categories = Category.all
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @categories = Category.all
  end

  # GET /customers/new
  def new
    @categories = Category.all
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @categories = Category.all
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save

        # create order/line-items from Cart
        current_cart = session[:cart]
        
        Order.process_order(@customer, current_cart)

        session.delete(:cart)
        #session.clear
        # or session[:cart] = {}

        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :phone, :email, :address1, :address2, :city, :state, :zip)
    end
end
