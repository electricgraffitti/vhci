class ServiceInquiriesController < ApplicationController
  
  before_filter :require_user, :except => [:new, :create]
  layout "admin"
  
  # GET /service_inquiries
  # GET /service_inquiries.xml
  def index
    @service_inquiries = ServiceInquiry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_inquiries }
    end
  end

  # GET /service_inquiries/1
  # GET /service_inquiries/1.xml
  def show
    @service_inquiry = ServiceInquiry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_inquiry }
    end
  end

  # GET /service_inquiries/new
  # GET /service_inquiries/new.xml
  def new
    @service_inquiry = ServiceInquiry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_inquiry }
    end
  end

  # GET /service_inquiries/1/edit
  def edit
    @service_inquiry = ServiceInquiry.find(params[:id])
  end

  # POST /service_inquiries
  # POST /service_inquiries.xml
  def create
    @service_inquiry = ServiceInquiry.new(params[:service_inquiry])
    s = Service.select_service(params[:service_inquiry][:claim_type_id])

    respond_to do |format|
      if @service_inquiry.save
        format.html { redirect_to service_path(s) }
        format.xml  { render :xml => @service_inquiry, :status => :created, :location => @service_inquiry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_inquiries/1
  # PUT /service_inquiries/1.xml
  def update
    @service_inquiry = ServiceInquiry.find(params[:id])

    respond_to do |format|
      if @service_inquiry.update_attributes(params[:service_inquiry])
        flash[:notice] = 'ServiceInquiry was successfully updated.'
        format.html { redirect_to(@service_inquiry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_inquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_inquiries/1
  # DELETE /service_inquiries/1.xml
  def destroy
    @service_inquiry = ServiceInquiry.find(params[:id])
    @service_inquiry.destroy

    respond_to do |format|
      format.html { redirect_to(service_inquiries_url) }
      format.xml  { head :ok }
    end
  end
end
