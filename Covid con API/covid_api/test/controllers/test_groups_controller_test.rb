require "test_helper"

class TestGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_group = test_groups(:one)
  end

  test "should get index" do
    get test_groups_url, as: :json
    assert_response :success
  end

  test "should create test_group" do
    assert_difference('TestGroup.count') do
      post test_groups_url, params: { test_group: { max_applicants: @test_group.max_applicants, name: @test_group.name } }, as: :json
    end

    assert_response 201
  end

  test "should show test_group" do
    get test_group_url(@test_group), as: :json
    assert_response :success
  end

  test "should update test_group" do
    patch test_group_url(@test_group), params: { test_group: { max_applicants: @test_group.max_applicants, name: @test_group.name } }, as: :json
    assert_response 200
  end

  test "should destroy test_group" do
    assert_difference('TestGroup.count', -1) do
      delete test_group_url(@test_group), as: :json
    end

    assert_response 204
  end
end
