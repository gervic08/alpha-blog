# frozen_string_literal: true

require "simplecov"
SimpleCov.start
require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest
  setup do
    @admin = User.create(username: "admin", email: "admin@example.com", password: "admin123", admin: true)
    sign_in_as(@admin)
    @category = Category.create(name: "Testing")
  end

  test "get article new form and create an article" do
    get "/articles/new"
    assert_response :success
    assert_difference "Article.count", 1 do
      post articles_path, params: { article: { title: "Testing Article", description: "Article for integration test", category_ids: [@category.id] } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "succesfully", response.body
  end
end
