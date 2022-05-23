# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @articles = Article.order(:title).page params[:page]
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end 

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was created succesfully.'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was successfully updated.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article was successfully destroyed.'
      redirect_to @article
    else
      flash[:alert] = 'Article doesn´t exist. '
      redirect_to 'show'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    unless current_user == @article.user || current_user.admin?
      flash[:alert] = "Your user is not allowed to do that"
      redirect_to articles_path
    end
  end
end
