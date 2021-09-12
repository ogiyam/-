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
      redirect_to new_todo_path, notice: "ジャンルを追加しました"
    else
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
  #   if @todo.destroy
        respond_to do |format|
        format.html { redirect_to new_todo_path }
        format.json { render json: { id: params[:id] } }
        format.json {render :json => @todo}
  #       redirect_to new_todo_path
  #       end
  #   end
  # end

    # todo_params[:todo].each do |todo|
    #   Todo.destroy(name: todo[:name])
    end
  end



  private

  def todo_params
    params.require(:todo).permit(:task)
  end

end

