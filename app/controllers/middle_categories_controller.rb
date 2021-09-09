class MiddleCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def index
    @middle_categories = MiddleCategory.all
    @middle_category = MiddleCategory.new
  end

  def create
    @middle_category = current_user.middle_categories.new(middle_category_params)
    @middle_category.large_category_id = @large_category.id
    if @middle_category.save
      redirect_to large_category_middle_categories_path(@middle_category), notice: "中カテゴリーを追加しました"
    else
      @middle_categories = MiddleCategory.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @middle_categories.update(middle_category_params)
      redirect_to large_category_middle_categories_path(@middle_category), notice: "中カテゴリーを更新しました"
    else
      render "edit"
    end
  end

  def destory
    @middle_category.destroy
    redirect_to large_category_middle_categories_path(middle_category.large_category,middle_category)
  end


  private

  def middle_category_params
    params.require(:middle_category).permit(:problem, :solution)
  end

  def ensure_correct_user
    @middle_categories = MiddleCategory.find(params[:id])
    unless @middle_categories.user == current_user
      redirect_to large_category_middle_categories_path
    end
  end
end
