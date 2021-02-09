require "test_helper"

class InvoiceItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_item = invoice_items(:one)
  end

  test "should get index" do
    get invoice_items_url, as: :json
    assert_response :success
  end

  test "should create invoice_item" do
    assert_difference('InvoiceItem.count') do
      post invoice_items_url, params: { invoice_item: { quantity: @invoice_item.quantity, unit_price: @invoice_item.unit_price } }, as: :json
    end

    assert_response 201
  end

  test "should show invoice_item" do
    get invoice_item_url(@invoice_item), as: :json
    assert_response :success
  end

  test "should update invoice_item" do
    patch invoice_item_url(@invoice_item), params: { invoice_item: { quantity: @invoice_item.quantity, unit_price: @invoice_item.unit_price } }, as: :json
    assert_response 200
  end

  test "should destroy invoice_item" do
    assert_difference('InvoiceItem.count', -1) do
      delete invoice_item_url(@invoice_item), as: :json
    end

    assert_response 204
  end
end
