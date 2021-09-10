class SmallCategoriesController < ApplicationController
  def index
     @small_categories = SmallCategory.all
  end

  def new
    @small_category = SmallCategory.new
  end

  def create
    @small_category = SmallCategory.new(small_category_params)
    @small_category.user_id = current_user.id
    if @small_category.save
      redirect_to large_categories_path(@small_category), notice: "ノートを追加しました"
    else
      @small_categories = SmallCategory.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @small_categories.update(small_category_params)
      redirect_to small_categories_path(@small_category), notice: "ノートを更新しました"
    else
      render "edit"
    end
  end

  def destory
    @small_category.destroy
    redirect_to small_categories_path
  end

  private

  def small_category_params
    params.require(:small_category).permit(:title, :note)
  end

  def ensure_correct_user
    @small_categories = SmallCategory.find(params[:id])
    unless @small_categories.user == current_user
      redirect_to small_categories_path
    end
  end
end
