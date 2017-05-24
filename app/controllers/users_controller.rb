class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show, :destroy]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザー登録が完了しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
