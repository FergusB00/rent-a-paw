class UsersController < ApplicationController

  def profile
    @user = current_user
    @dog = Dog.new
    @dogs = current_user.dogs
  end

end
