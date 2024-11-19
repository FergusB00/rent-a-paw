class DogsController < ApplicationController
  before_action :set_dog, only: [:show]

  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def show
    @booking = Booking.new
  end


  private

  def set_dog
    @dog = Dog.find(params[:id])
  end


end
