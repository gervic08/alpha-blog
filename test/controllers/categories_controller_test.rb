require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @category = Category.create(name: "Sports")
  end

  test "should get index of categories" do
    get categories_url
    assert_response :success
  end

  test "should get new category" do
    get new_category_url
    assert_response :success
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end
end 
