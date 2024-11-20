class DogsController < ApplicationController
  require 'json'
  before_action :set_dog, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def show
    @booking = Booking.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    p "valid - #{@dog.valid?}"
    respond_to do |format|
      if @dog.save
        p "here"
        format.html { redirect_to profile_path, notice: "Dog successfully added" }
        format.json
      else
        format.html { redirect_to profile_path, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to profile_path, notice: "Dog information successfully updated"
    else
      redirect_to profile_path, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    redirect_to profile_path, status: :see_other, notice: "#{@dog.name} deleted"
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:breed, :age, :price, :size, :description, :name, :photo)
  end

end
