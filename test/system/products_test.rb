require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Avaliable", with: @product.avaliable
    fill_in "Date", with: @product.date
    fill_in "Description", with: @product.description
    fill_in "Gtin", with: @product.gtin
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    fill_in "Productcode", with: @product.productCode
    fill_in "Productmax", with: @product.productMax
    fill_in "Productmin", with: @product.productMin
    fill_in "Quantity", with: @product.quantity
    fill_in "Rfid", with: @product.rfid
    fill_in "Salecost", with: @product.saleCost
    fill_in "Saleprice", with: @product.salePrice
    fill_in "Unity", with: @product.unity
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Avaliable", with: @product.avaliable
    fill_in "Date", with: @product.date
    fill_in "Description", with: @product.description
    fill_in "Gtin", with: @product.gtin
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    fill_in "Productcode", with: @product.productCode
    fill_in "Productmax", with: @product.productMax
    fill_in "Productmin", with: @product.productMin
    fill_in "Quantity", with: @product.quantity
    fill_in "Rfid", with: @product.rfid
    fill_in "Salecost", with: @product.saleCost
    fill_in "Saleprice", with: @product.salePrice
    fill_in "Unity", with: @product.unity
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
