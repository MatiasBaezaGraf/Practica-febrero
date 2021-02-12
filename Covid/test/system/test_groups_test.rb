require "application_system_test_case"

class TestGroupsTest < ApplicationSystemTestCase
  setup do
    @test_group = test_groups(:one)
  end

  test "visiting the index" do
    visit test_groups_url
    assert_selector "h1", text: "Test Groups"
  end

  test "creating a Test group" do
    visit test_groups_url
    click_on "New Test Group"

    fill_in "Max applicants", with: @test_group.max_applicants
    fill_in "Name", with: @test_group.name
    click_on "Create Test group"

    assert_text "Test group was successfully created"
    click_on "Back"
  end

  test "updating a Test group" do
    visit test_groups_url
    click_on "Edit", match: :first

    fill_in "Max applicants", with: @test_group.max_applicants
    fill_in "Name", with: @test_group.name
    click_on "Update Test group"

    assert_text "Test group was successfully updated"
    click_on "Back"
  end

  test "destroying a Test group" do
    visit test_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test group was successfully destroyed"
  end
end
