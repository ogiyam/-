class TodosController < ApplicationController
  before_action :authenticate_user!

  def new
   @todos = Todo.all
   @todo = Todo.new
  end

  def create
   @todos = Todo.all
   @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to new_todo_path, notice: "ジャンルを追加しました"
    else
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to new_todo_path
  end

  private

  def todo_params
    params.require(:todo).permit(:task)
  end

end

