class EmployeesController < ApplicationController
  
  before_filter :employee_admin?, :only => [:new, :create]
  before_filter :require_employee, :except => [:new, :create];
  
  # GET /employees
  # GET /employees.xml
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.xml
  def show
    @employee = Employee.find(params[:id])
    @owner_tickets = Ticket.owned_tickets(@employee).priority_listed.open_tickets.not_complete.not_closed
    @assigned_tickets = Ticket.assigned_tickets(@employee).priority_listed.not_closed
    @complete_tickets = Ticket.owned_tickets(@employee).open_tickets.complete.not_closed
    @overdue_tickets = Ticket.owned_tickets(@employee).overdue.not_closed
    @overdue_assigned_tickets = Ticket.assigned_tickets(@employee).overdue.not_closed

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.xml
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        flash[:notice] = 'Employee was successfully created.'
        format.html { redirect_to(@employee) }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        flash[:notice] = 'Employee was successfully updated.'
        format.html { redirect_to(@employee) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
  def destroy
    @employee = current_employee
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to(employees_url) }
      format.xml  { head :ok }
    end
  end
end
