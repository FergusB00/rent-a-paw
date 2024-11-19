class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :create, :update, :destroy]

  def index
    @dogs = Dog.all
    @dog = Dog.new
  end

  def show
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to profile_path, notice: "Dog successfully added"
    else
      redirect_to profile_path, status: :unprocessable_entity
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
    redirect_to profile_path, notice: "#{@dog.name} deleted"
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:breed, :age, :price, :size, :description, :name)
  end


end
