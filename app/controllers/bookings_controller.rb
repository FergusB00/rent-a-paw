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
      redirect_to dogs_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
