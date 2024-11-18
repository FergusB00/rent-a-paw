class DogsController < ApplicationController
  def home
  end

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
