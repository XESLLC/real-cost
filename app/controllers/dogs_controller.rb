class DogsController < ApplicationController

  def index
    if !current_user
      redirect_to root_path, notice: "You must sign in"
    end
    @dog = Dog.new
    @breeds = Breed.all
  end

  def create
    @dog = Dog.new(dog_params.merge(user_id: current_user.id))
    if @dog.save
      redirect_to models_path
    else
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :weight, :breed_id, :user_id)
  end

end
