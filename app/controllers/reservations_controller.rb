class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = current_user.reservations
  end

  def new
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:room_id])
    @reservation.room = @room
    if @reservation.checkout_date.nil?
      flash.now[:alert] = "日付を指定ください"
      render 'rooms/show'
    elsif @reservation.guests_count.nil?
      flash.now[:alert] = "予約人数を入力してください"
      render 'rooms/show'
    elsif @reservation.checkout_date < @reservation.check_in_date
      flash.now[:alert] = "開始日より後の日付をを入力してください"
      render 'rooms/show'
    else
      @reservation.total_days = @reservation.amount_days
      @reservation.total_amount = @reservation.amount_price
    end

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:reservation][:room_id])
    @reservation.room = @room
    @reservation.save!
    render "complete"
  end

  def complete
  end


  private

  def reservation_params
    params.permit(:check_in_date, :checkout_date, :guests_count)
  end
end
