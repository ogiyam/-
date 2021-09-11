class GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
   @genres = Genre.all
   @genre = Genre.new
  end

  def create
  @genres = Genre.all
  @genre = Genre.new(genre_params)
    if @genre.save!
      redirect_to genres_path, notice: "ジャンルを追加しました"
    else
      render :index
    end
  end

  def edit
  end
  
  def update
    if @genre.update(genre_params)
      redirect_to genres_path, notice: "ジャンルを更新しました"
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def ensure_correct_user
    @genre = Genre.find(params[:id])
    unless @genres.user == current_user
      redirect_to genres_path
    end
  end
end
