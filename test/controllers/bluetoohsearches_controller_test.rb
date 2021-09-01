require 'test_helper'

class BluetoohsearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bluetoohsearch = bluetoohsearches(:one)
  end

  test "should get index" do
    get bluetoohsearches_url
    assert_response :success
  end

  test "should get new" do
    get new_bluetoohsearch_url
    assert_response :success
  end

  test "should create bluetoohsearch" do
    assert_difference('Bluetoohsearch.count') do
      post bluetoohsearches_url, params: { bluetoohsearch: { rfidCode: @bluetoohsearch.rfidCode } }
    end

    assert_redirected_to bluetoohsearch_url(Bluetoohsearch.last)
  end

  test "should show bluetoohsearch" do
    get bluetoohsearch_url(@bluetoohsearch)
    assert_response :success
  end

  test "should get edit" do
    get edit_bluetoohsearch_url(@bluetoohsearch)
    assert_response :success
  end

  test "should update bluetoohsearch" do
    patch bluetoohsearch_url(@bluetoohsearch), params: { bluetoohsearch: { rfidCode: @bluetoohsearch.rfidCode } }
    assert_redirected_to bluetoohsearch_url(@bluetoohsearch)
  end

  test "should destroy bluetoohsearch" do
    assert_difference('Bluetoohsearch.count', -1) do
      delete bluetoohsearch_url(@bluetoohsearch)
    end

    assert_redirected_to bluetoohsearches_url
  end
end
