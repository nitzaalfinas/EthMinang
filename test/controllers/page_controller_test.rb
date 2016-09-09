require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get wallets" do
    get page_wallets_url
    assert_response :success
  end

  test "should get contracts" do
    get page_contracts_url
    assert_response :success
  end

end
