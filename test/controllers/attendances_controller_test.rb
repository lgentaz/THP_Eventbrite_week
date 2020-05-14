require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendances_index_url
    assert_response :success
  end

  test "should get new" do
    get attendances_new_url
    assert_response :success
  end

end
