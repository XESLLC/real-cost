class ModelsController < ApplicationController

  def index
    @model1 = Dog.first
  end

  private

  def model_params
    params.require(:model).permit(:name, :breed_id, :age, :weight)
  end

end
