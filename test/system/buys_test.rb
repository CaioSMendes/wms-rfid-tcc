require "application_system_test_case"

class BuysTest < ApplicationSystemTestCase
  setup do
    @buy = buys(:one)
  end

  test "visiting the index" do
    visit buys_url
    assert_selector "h1", text: "Buys"
  end

  test "creating a Buy" do
    visit buys_url
    click_on "New Buy"

    fill_in "Costadd", with: @buy.costAdd
    fill_in "Datebuy", with: @buy.dateBuy
    fill_in "Description", with: @buy.description
    fill_in "Discount", with: @buy.discount
    fill_in "Icms", with: @buy.icms
    fill_in "Ipi", with: @buy.ipi
    fill_in "Measurement", with: @buy.measurement
    fill_in "Nameproduct", with: @buy.nameProduct
    fill_in "Price", with: @buy.price
    fill_in "Quantity", with: @buy.quantity
    fill_in "Shipping", with: @buy.shipping
    click_on "Create Buy"

    assert_text "Buy was successfully created"
    click_on "Back"
  end

  test "updating a Buy" do
    visit buys_url
    click_on "Edit", match: :first

    fill_in "Costadd", with: @buy.costAdd
    fill_in "Datebuy", with: @buy.dateBuy
    fill_in "Description", with: @buy.description
    fill_in "Discount", with: @buy.discount
    fill_in "Icms", with: @buy.icms
    fill_in "Ipi", with: @buy.ipi
    fill_in "Measurement", with: @buy.measurement
    fill_in "Nameproduct", with: @buy.nameProduct
    fill_in "Price", with: @buy.price
    fill_in "Quantity", with: @buy.quantity
    fill_in "Shipping", with: @buy.shipping
    click_on "Update Buy"

    assert_text "Buy was successfully updated"
    click_on "Back"
  end

  test "destroying a Buy" do
    visit buys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buy was successfully destroyed"
  end
end
