require "test_helper"

class ReplacementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @replacement = replacements(:one)
  end

  test "should get index" do
    get replacements_url
    assert_response :success
  end

  test "should get new" do
    get new_replacement_url
    assert_response :success
  end

  test "should create replacement" do
    assert_difference('Replacement.count') do
      post replacements_url, params: { replacement: { manufacture_date: @replacement.manufacture_date, name: @replacement.name, serial_number: @replacement.serial_number } }
    end

    assert_redirected_to replacement_url(Replacement.last)
  end

  test "should show replacement" do
    get replacement_url(@replacement)
    assert_response :success
  end

  test "should get edit" do
    get edit_replacement_url(@replacement)
    assert_response :success
  end

  test "should update replacement" do
    patch replacement_url(@replacement), params: { replacement: { manufacture_date: @replacement.manufacture_date, name: @replacement.name, serial_number: @replacement.serial_number } }
    assert_redirected_to replacement_url(@replacement)
  end

  test "should destroy replacement" do
    assert_difference('Replacement.count', -1) do
      delete replacement_url(@replacement)
    end

    assert_redirected_to replacements_url
  end
end
