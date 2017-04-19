require 'test_helper'

class LabelconfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labelconfig = labelconfigs(:one)
  end

  test "should get index" do
    get labelconfigs_url, as: :json
    assert_response :success
  end

  test "should create labelconfig" do
    assert_difference('Labelconfig.count') do
      post labelconfigs_url, params: { labelconfig: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show labelconfig" do
    get labelconfig_url(@labelconfig), as: :json
    assert_response :success
  end

  test "should update labelconfig" do
    patch labelconfig_url(@labelconfig), params: { labelconfig: {  } }, as: :json
    assert_response 200
  end

  test "should destroy labelconfig" do
    assert_difference('Labelconfig.count', -1) do
      delete labelconfig_url(@labelconfig), as: :json
    end

    assert_response 204
  end
end
