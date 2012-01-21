class TicketUpdatesController < ApplicationController
  
  before_filter :require_employee
  
  # GET /ticket_updates
  # GET /ticket_updates.xml
  def index
    @ticket_updates = TicketUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ticket_updates }
    end
  end

  # GET /ticket_updates/1
  # GET /ticket_updates/1.xml
  def show
    @ticket_update = TicketUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket_update }
    end
  end

  # GET /ticket_updates/new
  # GET /ticket_updates/new.xml
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @ticket_update.ticket.build
    @ticket_update = TicketUpdate.new
    @ticket_update.ticket_assets.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket_update }
    end
  end

  # GET /ticket_updates/1/edit
  def edit
    @ticket_update = TicketUpdate.find(params[:id])
  end

  # POST /ticket_updates
  # POST /ticket_updates.xml
  def create
    @form = params
    @ticket_update = TicketUpdate.new(params[:ticket_update])
    @ticket_update.ticket.update_attributes(params[:ticket])
    
    update_ticket = ApplicationMailer.create_update_ticket_mailer(params)
    update_ticket.set_content_type("text/html")
    respond_to do |format|
      if @ticket_update.save
        ApplicationMailer.deliver(update_ticket)
        flash[:notice] = 'TicketUpdate was successfully created.'
        format.html { redirect_to ticket_path(params[:ticket_update][:ticket_id]) }
        format.xml  { render :xml => @ticket_update, :status => :created, :location => @ticket_update }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket_update.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_updates/1
  # PUT /ticket_updates/1.xml
  def update
    @ticket_update = TicketUpdate.find(params[:id])

    respond_to do |format|
      if @ticket_update.update_attributes(params[:ticket_update])
        flash[:notice] = 'TicketUpdate was successfully updated.'
        format.html { redirect_to(@ticket_update) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket_update.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_updates/1
  # DELETE /ticket_updates/1.xml
  def destroy
    @ticket_update = TicketUpdate.find(params[:id])
    @ticket_update.destroy

    respond_to do |format|
      format.html { redirect_to(ticket_updates_url) }
      format.xml  { head :ok }
    end
  end
end
