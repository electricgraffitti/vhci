class ServicesController < ApplicationController
  
  before_filter :require_user, :except => [:index, :show]

  def index
    @services = Service.order("created_at ASC").includes(:claim_type)
    @service_inquiry = ServiceInquiry.new
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @services }
      format.rss { render :rss => @services }
      format.atom
    end
  end

  def show
    @service = Service.find(params[:id])
    @acronym = @service.set_acronym
    @quote = Quote.page_quote(@acronym).last
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service }
    end
  end

  def new
    @service = Service.new
    @service.case_studies.build
    @service.brochures.build
    @service.coverflows.build
    
    3.times do 
      @service.service_bullets.build
    end
    respond_to do |format|
      format.html { render :layout => "admin"}
      format.xml  { render :xml => @service }
    end
  end

  def edit
    @service = Service.find(params[:id])
    if @service.case_studies.blank?
      @service.case_studies.build
    end
    if @service.brochures.blank?
      @service.brochures.build
    end
    if @service.coverflows.blank?
      @service.coverflows.build
    end
    if @service.service_bullets.blank?
      3.times do
        @service.service_bullets.build
      end
    end
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end

  # POST /services
  # POST /services.xml
  def create
    @service = Service.new(params[:service])
    
    respond_to do |format|
      if @service.save
        flash[:notice] = 'Service was successfully created.'
        format.html { redirect_to(@service) }
        format.xml  { render :xml => @service, :status => :created, :location => @service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.xml
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        flash[:notice] = 'Service was successfully updated.'
        format.html { redirect_to(@service) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.xml
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(services_url) }
      format.xml  { head :ok }
    end
  end
end
