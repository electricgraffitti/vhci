class TicketsController < ApplicationController
  
  before_filter :require_employee
  layout 'employee2'
  
  # GET /tickets
  # GET /tickets.xml
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])
    @owner = Owner.find_by_ticket_id(@ticket.id)
    @ticket_update = TicketUpdate.new
    @ticket_update.ticket_assets.build
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new
    @ticket.owner.build
    @ticket.ticket_assets.build
    @ticket_update = TicketUpdate.new
    @marketing = Employee.department('Marketing')
    @administration = Employee.department('Administration')
    @operations = Employee.department('Operations')
    @account_managment = Employee.department('Account Mgmt')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @employees = Employee.all
    if @ticket.owner.blank?
      @ticket.owner.build
    end
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @form = params
    @ticket = Ticket.new(params[:ticket])
    new_ticket = ApplicationMailer.create_new_ticket_mailer(params)
    new_ticket.set_content_type("text/html")
    respond_to do |format|
      if @ticket.save
        ApplicationMailer.deliver(new_ticket)
        flash[:notice] = 'Ticket was successfully created.'
        format.html { redirect_to(@ticket) }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { redirect_to(@ticket) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
end
