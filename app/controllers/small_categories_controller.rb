class SmallCategoriesController < ApplicationController
  before_action :authenticate_user!


  def index
   @large_category = LargeCategory.find(params[:large_category_id])
   @small_categories = SmallCategory.all
  end

  def new
    @large_category = LargeCategory.find(params[:large_category_id])
    @small_category = SmallCategory.new
  end

  def create
    @large_category = LargeCategory.find(params[:large_category_id])
    @small_category = SmallCategory.new(small_category_params)
    @small_category.user_id = current_user.id
    if @small_category.save
      redirect_to large_categories_path(@small_category), notice: "ノートを追加しました"
    else
      @small_categories = SmallCategory.all
      render 'index'
    end
  end

  def show
    @large_category = LargeCategory.find(params[:large_category_id])
    @small_category = SmallCategory.find(params[:id])
  end

  def edit
  end

  def update
    @large_category = LargeCategory.find(params[:large_category_id])
    if @small_category.update(small_category_params)
      redirect_to small_categories_path(@small_category), notice: "ノートを更新しました"
    else
      render "edit"
    end
  end

  def destory
    # @small_category = SmallCategory.find(params[:id])
    @small_category = SmallCategory.find_by(id: params[:id], large_category_id: params[:large_category_id], user_id: current_user.id).destroy
    redirect_to small_categories_path(@small_category)
  end

  private

  def small_category_params
    params.require(:small_category).permit(:title, :note)
  end
end