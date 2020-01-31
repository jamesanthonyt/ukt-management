require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get unauthorised" do
    get pages_unauthorised_url
    assert_response :success
  end

end
