require 'test_helper'

class NewdomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newdomain = newdomains(:one)
  end

  test "should get index" do
    get newdomains_url
    assert_response :success
  end

  test "should get new" do
    get new_newdomain_url
    assert_response :success
  end

  test "should create newdomain" do
    assert_difference('Newdomain.count') do
      post newdomains_url, params: { newdomain: { domain_name: @newdomain.domain_name } }
    end

    assert_redirected_to newdomain_url(Newdomain.last)
  end

  test "should show newdomain" do
    get newdomain_url(@newdomain)
    assert_response :success
  end

  test "should get edit" do
    get edit_newdomain_url(@newdomain)
    assert_response :success
  end

  test "should update newdomain" do
    patch newdomain_url(@newdomain), params: { newdomain: { domain_name: @newdomain.domain_name } }
    assert_redirected_to newdomain_url(@newdomain)
  end

  test "should destroy newdomain" do
    assert_difference('Newdomain.count', -1) do
      delete newdomain_url(@newdomain)
    end

    assert_redirected_to newdomains_url
  end
end
