class TutorialVideosController < ApplicationController
  
  before_filter :require_user, :except => [:index, :show]
  
  # GET /tutorial_videos
  # GET /tutorial_videos.xml
  def index
    @tutorial_videos = TutorialVideo.list(5, params[:page])
    @press_releases = Article.type('press_release').limit(5)
    @events = Event.upcoming_events.limit(1).last_created
    @advertisements = Advertisement.current_list.limit(2).order_list
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /tutorial_videos/1
  # GET /tutorial_videos/1.xml
  def show
    @tutorial_video = TutorialVideo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutorial_video }
    end
  end

  # GET /tutorial_videos/new
  # GET /tutorial_videos/new.xml
  def new
    @tutorial_video = TutorialVideo.new

    respond_to do |format|
      format.html { render :layout => "admin" }
      format.xml  { render :xml => @tutorial_video }
    end
  end

  # GET /tutorial_videos/1/edit
  def edit
    @tutorial_video = TutorialVideo.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => "admin" }
    end
  end

  # POST /tutorial_videos
  # POST /tutorial_videos.xml
  def create
    @tutorial_video = TutorialVideo.new(params[:tutorial_video])

    respond_to do |format|
      if @tutorial_video.save
        flash[:notice] = 'TutorialVideo was successfully created.'
        format.html { redirect_to admin_tutorial_videos_path }
        format.xml  { render :xml => @tutorial_video, :status => :created, :location => @tutorial_video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tutorial_video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorial_videos/1
  # PUT /tutorial_videos/1.xml
  def update
    @tutorial_video = TutorialVideo.find(params[:id])

    respond_to do |format|
      if @tutorial_video.update_attributes(params[:tutorial_video])
        flash[:notice] = 'TutorialVideo was successfully updated.'
        format.html { redirect_to admin_tutorial_videos_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutorial_video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorial_videos/1
  # DELETE /tutorial_videos/1.xml
  def destroy
    @tutorial_video = TutorialVideo.find(params[:id])
    @tutorial_video.destroy

    respond_to do |format|
      format.html { redirect_to(tutorial_videos_url) }
      format.xml  { head :ok }
    end
  end
end
