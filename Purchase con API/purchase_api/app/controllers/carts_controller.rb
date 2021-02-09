class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  def index
    if params[:user_name]
      @carts = Cart.filtername(params[:user_name])
    elsif params[:max]
      @carts = Cart.filterprice(params[:max])
    elsif params[:brand_id]
      @carts = Cart.filterbrand(params[:brand_id])
    elsif params[:minimum] and params[:maximum]
      @carts = Cart.filterperunit(params[:minimum], params[:maximum])
    elsif params[:from] and params[:to]
      @carts = Cart.filterfromto(params[:from], params[:to])
    else
      @carts = Cart.all
    end

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_name, :user_id, :bill_date)
    end
end
