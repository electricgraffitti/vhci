class ClaimTypesController < ApplicationController
  
  before_filter :require_user
  
  layout "admin"
  
  # GET /claim_types
  # GET /claim_types.xml
  def index
    @claim_types = ClaimType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @claim_types }
    end
  end

  # GET /claim_types/1
  # GET /claim_types/1.xml
  def show
    @claim_type = ClaimType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @claim_type }
    end
  end

  # GET /claim_types/new
  # GET /claim_types/new.xml
  def new
    @claim_type = ClaimType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @claim_type }
    end
  end

  # GET /claim_types/1/edit
  def edit
    @claim_type = ClaimType.find(params[:id])
  end

  # POST /claim_types
  # POST /claim_types.xml
  def create
    @claim_type = ClaimType.new(params[:claim_type])

    respond_to do |format|
      if @claim_type.save
        flash[:notice] = 'ClaimType was successfully created.'
        format.html { redirect_to(@claim_type) }
        format.xml  { render :xml => @claim_type, :status => :created, :location => @claim_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @claim_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /claim_types/1
  # PUT /claim_types/1.xml
  def update
    @claim_type = ClaimType.find(params[:id])

    respond_to do |format|
      if @claim_type.update_attributes(params[:claim_type])
        flash[:notice] = 'ClaimType was successfully updated.'
        format.html { redirect_to(@claim_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @claim_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_types/1
  # DELETE /claim_types/1.xml
  def destroy
    @claim_type = ClaimType.find(params[:id])
    @claim_type.destroy

    respond_to do |format|
      format.html { redirect_to(claim_types_url) }
      format.xml  { head :ok }
    end
  end
end
