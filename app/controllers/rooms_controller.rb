class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(params.require(:room).permit(:name,:description,:address,:price,:img))
    @room.user_id = current_user.id
    @user = current_user
    if @room.save
      redirect_to :rooms
      flash[:notice] = "部屋の登録が完了しました"
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
  end

  def search
    @user = current_user
    @rooms = Room.search(params[:search])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :rooms
  end
end
