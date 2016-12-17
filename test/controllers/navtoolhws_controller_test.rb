require 'test_helper'

class NavtoolhwsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @navtoolhw = navtoolhws(:one)
  end

  test "should get index" do
    get navtoolhws_url, as: :json
    assert_response :success
  end

  test "should create navtoolhw" do
    assert_difference('Navtoolhw.count') do
      post navtoolhws_url, params: { navtoolhw: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show navtoolhw" do
    get navtoolhw_url(@navtoolhw), as: :json
    assert_response :success
  end

  test "should update navtoolhw" do
    patch navtoolhw_url(@navtoolhw), params: { navtoolhw: {  } }, as: :json
    assert_response 200
  end

  test "should destroy navtoolhw" do
    assert_difference('Navtoolhw.count', -1) do
      delete navtoolhw_url(@navtoolhw), as: :json
    end

    assert_response 204
  end
end
