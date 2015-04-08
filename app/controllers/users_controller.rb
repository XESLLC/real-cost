class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path, notice: "#{@user.full_name} was created!"
    else
      reneder new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
