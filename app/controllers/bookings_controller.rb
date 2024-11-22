class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog
    if @booking.save
      redirect_to profile_path
    else
      redirect_to dog_path(@dog), status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path, status: :see_other, notice: "Booking deleted"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
