# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.order(:title).page params[:page]
  end

  def new
    @category = Category.new
  end

  def show
    @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category #{@category.name} successfully created"
      redirect_to @category
    else
      render 'new'
    end  
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admin users can perform this action"
      redirect_to categories_url
    end
  end
end
