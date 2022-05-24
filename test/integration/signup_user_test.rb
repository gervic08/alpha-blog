# frozen_string_literal: true

require "simplecov"
SimpleCov.start
require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest
  test "get signup user form and create user" do
    get "/signup"
    assert_response :success
    assert_difference "User.count", 1 do
      post users_path, params: { user: { username: "TestUser", email: "testuser@example.com", password: "12345" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Welcome", response.body
  end
end
