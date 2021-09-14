class TodosController < ApplicationController
	before_action :authenticate_user!

	def new
	 @todos = Todo.all.order(created_at: :desc)
	 @todo = Todo.new
	end

	def create
	 @todos = Todo.all
	 @todo = Todo.new(todo_params)
		if @todo.save
			redirect_to new_todo_path, notice: "「あとでまとめる」が追加されました"
		else
			render :new
		end
	end

	 def destroy
		@todo = Todo.find(params[:id])
    @todo.destroy
			redirect_to new_todo_path, notice: "まとめ終了"
 　　end


	private

	def todo_params
		params.require(:todo).permit(:task)
	end

 end



