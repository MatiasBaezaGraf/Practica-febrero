require "application_system_test_case"

class FlightsTest < ApplicationSystemTestCase
  setup do
    @flight = flights(:one)
  end

  test "visiting the index" do
    visit flights_url
    assert_selector "h1", text: "Flights"
  end

  test "creating a Flight" do
    visit flights_url
    click_on "New Flight"

    fill_in "Airport", with: @flight.airport
    fill_in "Arrival", with: @flight.arrival
    fill_in "Arrival date", with: @flight.arrival_date
    fill_in "Arrival place", with: @flight.arrival_place
    fill_in "Departure date", with: @flight.departure_date
    fill_in "Departure place", with: @flight.departure_place
    fill_in "Name", with: @flight.name
    fill_in "State code", with: @flight.state_code
    click_on "Create Flight"

    assert_text "Flight was successfully created"
    click_on "Back"
  end

  test "updating a Flight" do
    visit flights_url
    click_on "Edit", match: :first

    fill_in "Airport", with: @flight.airport
    fill_in "Arrival", with: @flight.arrival
    fill_in "Arrival date", with: @flight.arrival_date
    fill_in "Arrival place", with: @flight.arrival_place
    fill_in "Departure date", with: @flight.departure_date
    fill_in "Departure place", with: @flight.departure_place
    fill_in "Name", with: @flight.name
    fill_in "State code", with: @flight.state_code
    click_on "Update Flight"

    assert_text "Flight was successfully updated"
    click_on "Back"
  end

  test "destroying a Flight" do
    visit flights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flight was successfully destroyed"
  end
end
