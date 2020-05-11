class UsersController < ApplicationController
  def index
    @Users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to ("tables_path)
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
  end
end

private

 def user_params
   params.require(:user).permit(:name, :height)
 end
