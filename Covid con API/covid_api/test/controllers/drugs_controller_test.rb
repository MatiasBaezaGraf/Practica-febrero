require "test_helper"

class DrugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug = drugs(:one)
  end

  test "should get index" do
    get drugs_url, as: :json
    assert_response :success
  end

  test "should create drug" do
    assert_difference('Drug.count') do
      post drugs_url, params: { drug: { country: @drug.country, lab: @drug.lab, name: @drug.name } }, as: :json
    end

    assert_response 201
  end

  test "should show drug" do
    get drug_url(@drug), as: :json
    assert_response :success
  end

  test "should update drug" do
    patch drug_url(@drug), params: { drug: { country: @drug.country, lab: @drug.lab, name: @drug.name } }, as: :json
    assert_response 200
  end

  test "should destroy drug" do
    assert_difference('Drug.count', -1) do
      delete drug_url(@drug), as: :json
    end

    assert_response 204
  end
end
