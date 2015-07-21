require 'test_helper'

class CommentControllerTest < ActionController::TestCase
  test "should get usrLoby" do
    get :usrLoby
    assert_response :success
  end

  test "should get adminLoby" do
    get :adminLoby
    assert_response :success
  end

  test "should get usrElevator" do
    get :usrElevator
    assert_response :success
  end

  test "should get adminElevator" do
    get :adminElevator
    assert_response :success
  end

  test "should get usrGarden" do
    get :usrGarden
    assert_response :success
  end

  test "should get adminGarden" do
    get :adminGarden
    assert_response :success
  end

end
