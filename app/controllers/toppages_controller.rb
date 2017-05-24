class ToppagesController < ApplicationController
  def index
    @user = current_user
    
    if logged_in?
      redirect_to @user
    end
  end
end
