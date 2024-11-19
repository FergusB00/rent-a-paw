class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @bookings = Booking.find(params[:id])
  end

  def new
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
