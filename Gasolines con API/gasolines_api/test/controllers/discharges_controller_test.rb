require "test_helper"

class DischargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discharge = discharges(:one)
  end

  test "should get index" do
    get discharges_url, as: :json
    assert_response :success
  end

  test "should create discharge" do
    assert_difference('Discharge.count') do
      post discharges_url, params: { discharge: { date: @discharge.date, liters: @discharge.liters } }, as: :json
    end

    assert_response 201
  end

  test "should show discharge" do
    get discharge_url(@discharge), as: :json
    assert_response :success
  end

  test "should update discharge" do
    patch discharge_url(@discharge), params: { discharge: { date: @discharge.date, liters: @discharge.liters } }, as: :json
    assert_response 200
  end

  test "should destroy discharge" do
    assert_difference('Discharge.count', -1) do
      delete discharge_url(@discharge), as: :json
    end

    assert_response 204
  end
end
