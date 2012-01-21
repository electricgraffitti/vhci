class TicketStatusesController < ApplicationController
  
  before_filter :super?
  
  # GET /ticket_statuses
  # GET /ticket_statuses.xml
  def index
    @ticket_statuses = TicketStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ticket_statuses }
    end
  end

  # GET /ticket_statuses/1
  # GET /ticket_statuses/1.xml
  def show
    @ticket_status = TicketStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket_status }
    end
  end

  # GET /ticket_statuses/new
  # GET /ticket_statuses/new.xml
  def new
    @ticket_status = TicketStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket_status }
    end
  end

  # GET /ticket_statuses/1/edit
  def edit
    @ticket_status = TicketStatus.find(params[:id])
  end

  # POST /ticket_statuses
  # POST /ticket_statuses.xml
  def create
    @ticket_status = TicketStatus.new(params[:ticket_status])

    respond_to do |format|
      if @ticket_status.save
        flash[:notice] = 'TicketStatus was successfully created.'
        format.html { redirect_to(@ticket_status) }
        format.xml  { render :xml => @ticket_status, :status => :created, :location => @ticket_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_statuses/1
  # PUT /ticket_statuses/1.xml
  def update
    @ticket_status = TicketStatus.find(params[:id])

    respond_to do |format|
      if @ticket_status.update_attributes(params[:ticket_status])
        flash[:notice] = 'TicketStatus was successfully updated.'
        format.html { redirect_to(@ticket_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_statuses/1
  # DELETE /ticket_statuses/1.xml
  def destroy
    @ticket_status = TicketStatus.find(params[:id])
    @ticket_status.destroy

    respond_to do |format|
      format.html { redirect_to(ticket_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
