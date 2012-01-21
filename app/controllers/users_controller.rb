class UsersController < ApplicationController
  
  before_filter :require_user, :except => [:new, :create];
  before_filter :auth_super, :only => [:new, :create];
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    respond_to do |format|
      format.html { render :layout => "admin"}
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html { render :layout => "admin"}
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'New user created'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to home_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def admin_services
    @services = Service.all
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_articles
    @articles = Article.all :include => [:article_type]
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_events
    @events = Event.all
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_videos
    @videos = Video.all :include => [:video_type]
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_tutorial_videos
    @tutorial_videos = TutorialVideo.all
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_documents
    @documents = Document.all :include => [:document_type]
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_banners
    @banners = Banner.all
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_ads
    @advertisements = Advertisement.all
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
  
  def admin_quotes
    @quotes = Quote.all
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end
end
