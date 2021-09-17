class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      flash.now[:error] = @user.errors.full_messages
      render "edit"
    end
  end

    private

    def user_params
      params.require(:user).permit(:name, :image, :goal)
    end

    def ensure_correct_user
      @user = User.find(params[:id])
       if @user.id != current_user.id
         redirect_to user_path(current_user)
       end
    end
end
