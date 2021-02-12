require "application_system_test_case"

class AirwaysTest < ApplicationSystemTestCase
  setup do
    @airway = airways(:one)
  end

  test "visiting the index" do
    visit airways_url
    assert_selector "h1", text: "Airways"
  end

  test "creating a Airway" do
    visit airways_url
    click_on "New Airway"

    fill_in "Country", with: @airway.country
    fill_in "Name", with: @airway.name
    click_on "Create Airway"

    assert_text "Airway was successfully created"
    click_on "Back"
  end

  test "updating a Airway" do
    visit airways_url
    click_on "Edit", match: :first

    fill_in "Country", with: @airway.country
    fill_in "Name", with: @airway.name
    click_on "Update Airway"

    assert_text "Airway was successfully updated"
    click_on "Back"
  end

  test "destroying a Airway" do
    visit airways_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Airway was successfully destroyed"
  end
end
