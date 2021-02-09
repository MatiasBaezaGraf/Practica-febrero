class ItemCartsController < ApplicationController
  before_action :set_item_cart, only: [:show, :update, :destroy]

  # GET /item_carts
  def index
    if params[:b_m]
      @item_carts = ItemCart.filterb_m(params[:b_m])
    elsif params[:minimum] and params[:maximum]
      @item_carts = ItemCart.filterperprice(params[:minimum], params[:maximum])
    else
      @item_carts = ItemCart.all
    end

    render json: @item_carts
  end

  # GET /item_carts/1
  def show
    render json: @item_cart
  end

  # POST /item_carts
  def create
    @item_cart = ItemCart.new(item_cart_params)

    if @item_cart.save
      render json: @item_cart, status: :created, location: @item_cart
    else
      render json: @item_cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_carts/1
  def update
    if @item_cart.update(item_cart_params)
      render json: @item_cart
    else
      render json: @item_cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_carts/1
  def destroy
    @item_cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_cart
      @item_cart = ItemCart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_cart_params
      params.require(:item_cart).permit(:quantity, :unit_price, :cart_id, :component_id)
    end
end
