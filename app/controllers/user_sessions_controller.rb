class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login Successfull"
      redirect_to users_path
    else
      flash[:notice] = "Invalid login, please try gain"
      render :action => "new"
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Logout Successfull"
    redirect_to root_path
  end

end
