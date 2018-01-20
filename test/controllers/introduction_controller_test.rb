require 'test_helper'

class IntroductionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get introduction_index_url
    assert_response :success
  end

end
