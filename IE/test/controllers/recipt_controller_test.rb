require 'test_helper'

class ReciptControllerTest < ActionController::TestCase
  test "should get usrReciptVeiw" do
    get :usrReciptVeiw
    assert_response :success
  end

  test "should get usrReciptDetail" do
    get :usrReciptDetail
    assert_response :success
  end

end
