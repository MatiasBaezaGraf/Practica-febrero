require "application_system_test_case"

class ReplacementsTest < ApplicationSystemTestCase
  setup do
    @replacement = replacements(:one)
  end

  test "visiting the index" do
    visit replacements_url
    assert_selector "h1", text: "Replacements"
  end

  test "creating a Replacement" do
    visit replacements_url
    click_on "New Replacement"

    fill_in "Manufacture date", with: @replacement.manufacture_date
    fill_in "Name", with: @replacement.name
    fill_in "Serial number", with: @replacement.serial_number
    click_on "Create Replacement"

    assert_text "Replacement was successfully created"
    click_on "Back"
  end

  test "updating a Replacement" do
    visit replacements_url
    click_on "Edit", match: :first

    fill_in "Manufacture date", with: @replacement.manufacture_date
    fill_in "Name", with: @replacement.name
    fill_in "Serial number", with: @replacement.serial_number
    click_on "Update Replacement"

    assert_text "Replacement was successfully updated"
    click_on "Back"
  end

  test "destroying a Replacement" do
    visit replacements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Replacement was successfully destroyed"
  end
end
