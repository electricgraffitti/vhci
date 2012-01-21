class EmployeeSessionsController < ApplicationController
  
  def new
    @employee_session = EmployeeSession.new
  end
  
  def create
    @employee_session = EmployeeSession.new(params[:employee_session])
    if @employee_session.save
      flash[:notice] = "Login Successfull"
      redirect_to employee_path(current_employee)
    else
      flash[:notice] = "Invalid login, please try again"
      render :action => "new"
    end
  end

  def destroy
    @employee_session = EmployeeSession.find
    @employee_session.destroy
    flash[:notice] = "Logout Successfull"
    redirect_to root_path
  end
end
