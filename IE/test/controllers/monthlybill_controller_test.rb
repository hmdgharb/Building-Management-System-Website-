require 'test_helper'

class MonthlybillControllerTest < ActionController::TestCase
  test "should get MonthlyBillBox" do
    get :MonthlyBillBox
    assert_response :success
  end

  test "should get MonthlyBillManagment" do
    get :MonthlyBillManagment
    assert_response :success
  end

end
