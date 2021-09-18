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
    @large_category.user_id = current_user.id
    if @small_category.save
      redirect_to large_category_small_categories_path, notice: "ノートを追加しました"
    else
      @small_categories = SmallCategory.all
      render 'index'
    end
  end

  def show
    @small_category = SmallCategory.find(params[:id])
  end

  # def edit
  #   @small_category = SmallCategory.find(params[:id])
  # end

  # def update
  #   @large_category.user_id = current_user.id
  #   @large_category = LargeCategory.find(params[:large_category_id])
  #   @small_category = SmallCategory.find(params[:id])
  #   if @small_category.update(small_category_params)
  #     redirect_to large_category_small_categories_path(@small_category.large_category_id), notice: "ノートを更新しました"
  #   else
  #     render "edit"
  #   end
  # end

  def destroy
    @small_category = SmallCategory.find(params[:id])
    @small_category.destroy
    redirect_to large_category_small_categories_path(@small_category.large_category_id)
  end

  private

  def small_category_params
    params.require(:small_category).permit(:title, :note, :large_category_id)
  end
end