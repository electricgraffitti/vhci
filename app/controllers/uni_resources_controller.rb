class UniResourcesController < ApplicationController
  
  # GET /uni_resources
  # GET /uni_resources.xml
  def index
    @iuresources = UniResource.all

    respond_to do |format|
      format.html { render :layout => "insightu_2"}
      format.xml  { render :xml => @uni_resources }
    end
  end

  # GET /uni_resources/1
  # GET /uni_resources/1.xml
  def show
    @uni_resource = UniResource.find(params[:id])

    respond_to do |format|
      format.html { render :layout => "insightu_3"}
      format.xml  { render :xml => @uni_resource }
    end
  end

  # GET /uni_resources/new
  # GET /uni_resources/new.xml
  def new
    @uni_resource = UniResource.new

    respond_to do |format|
      format.html { render :layout => "insightu_short"}
      format.xml  { render :xml => @uni_resource }
    end
  end

  # GET /uni_resources/1/edit
  def edit
    @uni_resource = UniResource.find(params[:id])
    respond_to do |format|
      format.html { render :layout => "insightu_short"}
    end
  end

  # POST /uni_resources
  # POST /uni_resources.xml
  def create
    @uni_resource = UniResource.new(params[:uni_resource])

    respond_to do |format|
      if @uni_resource.save
        flash[:notice] = 'UniResource was successfully created.'
        format.html { redirect_to(@uni_resource) }
        format.xml  { render :xml => @uni_resource, :status => :created, :location => @uni_resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uni_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uni_resources/1
  # PUT /uni_resources/1.xml
  def update
    @uni_resource = UniResource.find(params[:id])

    respond_to do |format|
      if @uni_resource.update_attributes(params[:uni_resource])
        flash[:notice] = 'UniResource was successfully updated.'
        format.html { redirect_to(@uni_resource) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uni_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uni_resources/1
  # DELETE /uni_resources/1.xml
  def destroy
    @uni_resource = UniResource.find(params[:id])
    @uni_resource.destroy

    respond_to do |format|
      format.html { redirect_to(uni_resources_url) }
      format.xml  { head :ok }
    end
  end
end
