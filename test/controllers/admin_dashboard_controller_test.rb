require 'test_helper'

class AdminDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_dashboard_home_url
    assert_response :success
  end

end
