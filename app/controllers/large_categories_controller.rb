class LargeCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def index
    @user = User.find(params[:user_id])
    @large_categories = LargeCategory.all
    @large_category = LargeCategory.new
  end

  def create
    @large_category = LargeCategory.new(large_category_params)
    @large_category.user_id = current_user.id
    @large_category.genre_id = genre.id
    if @large_category.save
      redirect_to user_large_categories, notice: "大カテゴリーを追加しました"
    else
      @large_categories = LargeCategory.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @large_categories.update(large_category_params)
      redirect_to user_large_categories, notice: "大カテゴリーを更新しました"
    else
      render "edit"
    end
  end

  def destory
    @large_category.destroy
    redirect_to user_large_categories
  end

  private

  def large_category_params
    params.require(:large_category).permit(:user_id, :problem, :solution, :genre_id)
  end

  def ensure_correct_user
    @large_categories = LargeCategory.find(params[:id])
    unless @large_categories.user == current_user
      redirect_to user_large_categories
    end
  end
end
