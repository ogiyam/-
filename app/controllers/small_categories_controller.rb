class SmallCategoriesController < ApplicationController
  before_action :authenticate_user!


  def index
    @large_category = LargeCategory.find(params[:large_category_id])
    @small_categories = SmallCategory.where(large_category_id: @large_category.id)
    if params[:order] != nil
      if params[:order] == 'newly'
        @small_categories = @small_categories.order(created_at: :desc)
      elsif params[:order] == 'star'
        @small_categories = @small_categories.includes(:stars).order("stars.small_category_id desc, small_categories.created_at desc")
      end
    end
  end

  def new
    @large_category = LargeCategory.find(params[:large_category_id])
    @small_category = SmallCategory.new
  end

  def create
    @large_category = LargeCategory.find(params[:large_category_id])
    @small_category = SmallCategory.new(small_category_params)
    if @small_category.save
      redirect_to large_category_small_categories_path, notice: "ノートを追加しました"
    else
      flash.now[:notice]="エラーが発生しました"
      @small_categories = SmallCategory.where(large_category_id: @large_category.id)
      render 'index'
    end
  end

  def show
    @small_category = SmallCategory.find(params[:id])
  end

  def destroy
    if @small_category = SmallCategory.find(params[:id])
    @small_category.destroy
    redirect_to large_category_small_categories_path(@small_category.large_category_id), notice: "ノートを削除しました"
    else
      render "index"
    end
  end

  # before_action :check_guest, only: :destroy
  # def check_guest
  #   @small_category = SmallCategory.find(params[:id])
  #   if @small_category.large_category.user.email == 'guest@example.com'
  #     redirect_to large_category_small_categories_path(@small_category.large_category_id), notice: 'ゲストユーザーは削除ができません。'
  #   end
  # end

  private

  def small_category_params
    params.require(:small_category).permit(:title, :note, :large_category_id)
  end
end