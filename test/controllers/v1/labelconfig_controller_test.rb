require 'test_helper'

class V1::LabelconfigControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_labelconfig_index_url
    assert_response :success
  end

end
