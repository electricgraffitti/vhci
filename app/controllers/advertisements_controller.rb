class AdvertisementsController < ApplicationController
  
  before_filter :require_user
  
  def index
    @advertisements = Advertisement.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @advertisement = Advertisement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @advertisement = Advertisement.new

    respond_to do |format|
      format.html { render :layout => "admin" }
    end
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
    render :layout => "admin"
  end
  
  def create
    @advertisement = Advertisement.new(params[:advertisement])

    respond_to do |format|
      if @advertisement.save
        flash[:notice] = 'Advertisement was successfully created.'
        format.html { redirect_to(@advertisement) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @advertisement = Advertisement.find(params[:id])

    respond_to do |format|
      if @advertisement.update_attributes(params[:advertisement])
        flash[:notice] = 'Advertisement was successfully updated.'
        format.html { redirect_to(@advertisement) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy

    respond_to do |format|
      format.html { redirect_to(advertisements_url) }
    end
  end
end
