class WelcomeController < ApplicationController
  before_action :check_user
  
  def index
    @categories = Category.all
  end

end
