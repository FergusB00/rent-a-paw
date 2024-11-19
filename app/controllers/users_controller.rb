class UsersController < ApplicationController

  def profile
    @user = current_user
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to user_path(current_user), notice: "Dog successfully added"
    else
      render "users/show", status: :unprocessable_entity
    end
  end

  def dog_params
    params.require(:dog).permit(:breed, :age, :price, :size, :description, :name)
  end

end
