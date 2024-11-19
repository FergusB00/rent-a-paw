class UsersController < ApplicationController

  def profile
    @user = current_user
    @dog = Dog.new
  end

end
