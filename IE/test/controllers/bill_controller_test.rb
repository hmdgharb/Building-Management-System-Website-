require 'test_helper'

class BillControllerTest < ActionController::TestCase
  test "should get viewMbillContent" do
    get :viewMbillContent
    assert_response :success
  end

end
