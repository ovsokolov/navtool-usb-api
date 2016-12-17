require 'test_helper'

class NavtooldevicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @navtooldevice = navtooldevices(:one)
  end

  test "should get index" do
    get navtooldevices_url, as: :json
    assert_response :success
  end

  test "should create navtooldevice" do
    assert_difference('Navtooldevice.count') do
      post navtooldevices_url, params: { navtooldevice: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show navtooldevice" do
    get navtooldevice_url(@navtooldevice), as: :json
    assert_response :success
  end

  test "should update navtooldevice" do
    patch navtooldevice_url(@navtooldevice), params: { navtooldevice: {  } }, as: :json
    assert_response 200
  end

  test "should destroy navtooldevice" do
    assert_difference('Navtooldevice.count', -1) do
      delete navtooldevice_url(@navtooldevice), as: :json
    end

    assert_response 204
  end
end
