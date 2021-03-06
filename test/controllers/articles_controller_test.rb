require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.create(username: "Tester", email: "tester@test.com", password: "test123")
    @article = Article.create(title: "Test Article", description: "For testing only")
  end

  test "should get index of articles" do
    get articles_url
    assert_response :success
  end

  test "should get new article" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: { title: @article.title, description: @article.description } }
      Article.last.user = @user
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit article" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { description: @article.description, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
