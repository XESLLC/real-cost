class ModelsController < ApplicationController

  def index
    @items = current_user.dogs
    if !session[:array] || session[:new] == true || params[:session_new]
      @graph_array = []
      session[:array] = []
    end
  end

  def create
    session[:new] = false
    @graph_array = session[:array]
    @items = current_user.dogs
    if params[:picked_items] && params[:picked_items][:id] != ""
      item = Dog.find(params[:picked_items][:id])
      hash = {id: item.id, name: item.name, age: item.age, weight: item.weight, breed_id: item.breed_id}.merge!(item.cost)
      if session[:array].length == 3
        @graph_array = @graph_array.drop(1) << hash
        session[:array] = @graph_array
      else
        @graph_array << hash
        session[:array] = @graph_array
      end
    end
    redirect_to models_path
  end
end
