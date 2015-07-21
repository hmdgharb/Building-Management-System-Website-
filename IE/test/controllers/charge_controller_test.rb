require 'test_helper'

class ChargeControllerTest < ActionController::TestCase
  test "should get adminChargeView" do
    get :adminChargeView
    assert_response :success
  end

  test "should get usrChargeView" do
    get :usrChargeView
    assert_response :success
  end

end
