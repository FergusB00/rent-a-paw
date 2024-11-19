class DogsController < ApplicationController
  before_action :set_dog, only: [:create]

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = @user
    if @dog.save
      redirect_to dog_path(@restaurant)
    else
      render "dogs/show", status: :unprocessable_entity
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
