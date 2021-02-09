require "test_helper"

class ItemCartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_cart = item_carts(:one)
  end

  test "should get index" do
    get item_carts_url, as: :json
    assert_response :success
  end

  test "should create item_cart" do
    assert_difference('ItemCart.count') do
      post item_carts_url, params: { item_cart: { quantity: @item_cart.quantity, unit_price: @item_cart.unit_price } }, as: :json
    end

    assert_response 201
  end

  test "should show item_cart" do
    get item_cart_url(@item_cart), as: :json
    assert_response :success
  end

  test "should update item_cart" do
    patch item_cart_url(@item_cart), params: { item_cart: { quantity: @item_cart.quantity, unit_price: @item_cart.unit_price } }, as: :json
    assert_response 200
  end

  test "should destroy item_cart" do
    assert_difference('ItemCart.count', -1) do
      delete item_cart_url(@item_cart), as: :json
    end

    assert_response 204
  end
end
