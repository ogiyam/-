class TodosController < ApplicationController
	before_action :authenticate_user!

	def new
	 @todos = Todo.all.order(created_at: :desc)
	 @todo = Todo.new
	end

	def create
	 @todos = Todo.all.order(created_at: :desc)
	 @todo = Todo.new
	 todo = Todo.new(todo_params)
		if todo.save

		else
			render :new
		end
	end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice]="タスクおつかれさまでした！"
  end


	private

	def todo_params
		params.require(:todo).permit(:task)
	end


end




