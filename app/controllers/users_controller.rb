class UsersController < ApplicationController

  def show
    @user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user.params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      flash.now[:error] = @user.errors.full_messages
      render "edit"
    end

    private

    def user_params
      params.require(:user).permit(:name, :image, :goal, :genre)
    end

    def correct_user
      @user = User.find(params[:id])
       if @user.id != current_user.id
         redirect_to user_path(current_user)
       end
    end
  end
end
