class StarsController < ApplicationController
  def create
    @small_category = SmallCategory.find(params[:small_category_id])
    star = @small_category.stars.new(params[small_category_id: @small_category.id])
    star.save
  end

  def destroy
    @small_category = SmallCategory.find(params[:small_category_id])
    star = @small_category.stars.find_by(params[small_category_id: @small_category.id])
    star.destroy
  end
end
