class StudentSessionsController < ApplicationController
  
  layout 'insightu_short'
  
  def new
    @student_session = StudentSession.new
  end
  
  def create
    @student_session = StudentSession.new(params[:student_session])
    if @student_session.save
      flash[:notice] = "Login Successfull"
      redirect_to student_path(current_student)
    else
      flash[:notice] = "Invalid login, please try again"
      render :action => "new"
    end
  end

  def destroy
    @student_session = StudentSession.find
    @student_session.destroy
    flash[:notice] = "Logout Successfull"
    redirect_to root_path
  end
end
