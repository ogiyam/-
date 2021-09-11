class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:new, :create, :destory]
  
  def new
    @todo = Todo.new
  end
  
  def create
   @todo = Todo.new.new(todo_params)
    if @todo.save
      redirect_to new_todo_path, notice: "ジャンルを追加しました"
    else
      render :new
    end
  end
  
  def destory
    @todo.destroy
    redirect_to new_todo_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def ensure_correct_user
    @todo = Todo.find(params[:id])
    unless @genres.user == current_user
      redirect_to genres_path
    end
  end
end

