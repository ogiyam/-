class SearchesController < ApplicationController
  def search
    @large_categories = LargeCategory.includes(:small_categories).references(:small_categories).search(params[:keyword])
  end
end
