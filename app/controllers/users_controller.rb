class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def show
    @user = current_user
  end

  def show2
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:img, :name, :email, :introduction))
      flash[:notice] = "#{@user.name}の情報を更新しました"
      redirect_to  profile_users_path(@user)
    else
      render "edit"
    end
  end
end
