require "test_helper"

class AdoptionRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adoption_requests_index_url
    assert_response :success
  end

  test "should get new" do
    get adoption_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get adoption_requests_create_url
    assert_response :success
  end

  test "should get destroy" do
    get adoption_requests_destroy_url
    assert_response :success
  end
end
