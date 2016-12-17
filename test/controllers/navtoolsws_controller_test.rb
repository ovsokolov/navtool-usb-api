require 'test_helper'

class NavtoolswsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @navtoolsw = navtoolsws(:one)
  end

  test "should get index" do
    get navtoolsws_url, as: :json
    assert_response :success
  end

  test "should create navtoolsw" do
    assert_difference('Navtoolsw.count') do
      post navtoolsws_url, params: { navtoolsw: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show navtoolsw" do
    get navtoolsw_url(@navtoolsw), as: :json
    assert_response :success
  end

  test "should update navtoolsw" do
    patch navtoolsw_url(@navtoolsw), params: { navtoolsw: {  } }, as: :json
    assert_response 200
  end

  test "should destroy navtoolsw" do
    assert_difference('Navtoolsw.count', -1) do
      delete navtoolsw_url(@navtoolsw), as: :json
    end

    assert_response 204
  end
end
