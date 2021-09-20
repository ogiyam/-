class TodosController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, only: [:destroy]

	def new
	  @todos = Todo.all.order(created_at: :desc)
	  @todo = Todo.new
	end

	def create
	  @todos = Todo.all.order(created_at: :desc)
	  @todo = Todo.new
	 todo = Todo.new(todo_params)
		if todo.save
			render :new
		end
	end

  def destroy
	  @todo = Todo.find(params[:id])
	  @todo.destroy
	  flash[:notice]="おつかれさまでした！"
  end

	private

	def todo_params
	  params.require(:todo).permit(:task)
	end

  def ensure_correct_user
	  @todo = Todo.find(params[:id])
	  unless @todo.user == current_user
	    redirect_to new_todo_path
	  end
  end
end
