require "test_helper"

class AirwaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @airway = airways(:one)
  end

  test "should get index" do
    get airways_url, as: :json
    assert_response :success
  end

  test "should create airway" do
    assert_difference('Airway.count') do
      post airways_url, params: { airway: { country: @airway.country, name: @airway.name } }, as: :json
    end

    assert_response 201
  end

  test "should show airway" do
    get airway_url(@airway), as: :json
    assert_response :success
  end

  test "should update airway" do
    patch airway_url(@airway), params: { airway: { country: @airway.country, name: @airway.name } }, as: :json
    assert_response 200
  end

  test "should destroy airway" do
    assert_difference('Airway.count', -1) do
      delete airway_url(@airway), as: :json
    end

    assert_response 204
  end
end
