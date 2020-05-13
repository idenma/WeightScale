class UsersController < ApplicationController

  def index
    @Users = User.all
  end

  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.before_save
      log_in @user
      flash[:success] = "ようこそ体重管理アプリへ！"
      redirect_to new_table_path
    else
     render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
  end


private

 def user_params
   params.require(:user).permit(:name, :email, :height,
                                :password,:password_confirmation )
 end


end
