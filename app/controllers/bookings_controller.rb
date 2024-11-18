class BookingsController < ApplicationController
  def home
  end

  def index
    @bookings = Booking.all
  end

  def show
    @bookings = Booking.find(params[:id])
  end
end
