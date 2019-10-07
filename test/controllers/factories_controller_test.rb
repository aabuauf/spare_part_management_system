require 'test_helper'

class FactoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get factories_index_url
    assert_response :success
  end

end
