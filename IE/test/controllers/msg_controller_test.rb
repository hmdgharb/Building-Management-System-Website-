require 'test_helper'

class MsgControllerTest < ActionController::TestCase
  test "should get usrSendNewMsg" do
    get :usrSendNewMsg
    assert_response :success
  end

  test "should get usrSeeMsgList" do
    get :usrSeeMsgList
    assert_response :success
  end

  test "should get adminSendNewMsg" do
    get :adminSendNewMsg
    assert_response :success
  end

  test "should get adminSeeMsgList" do
    get :adminSeeMsgList
    assert_response :success
  end

  test "should get usrViewMsg" do
    get :usrViewMsg
    assert_response :success
  end

  test "should get adminViewMsg" do
    get :adminViewMsg
    assert_response :success
  end

end
