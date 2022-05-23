require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @admin = User.create(username: "admin", email: "admin@example.com", password: "admin123", admin: true)
    @category = Category.create(name: "Sports")
  end

  test "should get index of categories" do
    get categories_url
    assert_response :success
  end

  test "should get new category" do
    sign_in_as(@admin)
    get new_category_url
    assert_response :success
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin)
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: "Travel" } }
    end
    assert_redirected_to category_url(Category.last)
  end

  test "should not create a category if user not admin" do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: "Travel" } }
    end
    assert_redirected_to categories_url
  end
end 
