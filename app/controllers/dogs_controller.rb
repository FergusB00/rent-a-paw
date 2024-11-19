class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
    @booking = Booking.new
  end
end
