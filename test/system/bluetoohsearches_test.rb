require "application_system_test_case"

class BluetoohsearchesTest < ApplicationSystemTestCase
  setup do
    @bluetoohsearch = bluetoohsearches(:one)
  end

  test "visiting the index" do
    visit bluetoohsearches_url
    assert_selector "h1", text: "Bluetoohsearches"
  end

  test "creating a Bluetoohsearch" do
    visit bluetoohsearches_url
    click_on "New Bluetoohsearch"

    fill_in "Rfidcode", with: @bluetoohsearch.rfidCode
    click_on "Create Bluetoohsearch"

    assert_text "Bluetoohsearch was successfully created"
    click_on "Back"
  end

  test "updating a Bluetoohsearch" do
    visit bluetoohsearches_url
    click_on "Edit", match: :first

    fill_in "Rfidcode", with: @bluetoohsearch.rfidCode
    click_on "Update Bluetoohsearch"

    assert_text "Bluetoohsearch was successfully updated"
    click_on "Back"
  end

  test "destroying a Bluetoohsearch" do
    visit bluetoohsearches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bluetoohsearch was successfully destroyed"
  end
end
