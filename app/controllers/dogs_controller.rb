class DogsController < ApplicationController
  before_action :set_dog, only: [:show]

  def index
    @dogs = Dog.all
  end

  def show
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to profile_path, notice: "Dog successfully added"
    else
      render "users/profile", status: :unprocessable_entity
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def dog_params
    params.require(:dog).permit(:breed, :age, :price, :size, :description, :name)
  end


end
