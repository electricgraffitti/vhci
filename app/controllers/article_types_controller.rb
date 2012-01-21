class ArticleTypesController < ApplicationController
  
  before_filter :require_user
  layout "admin"
  
  # GET /article_types
  # GET /article_types.xml
  def index
    @article_types = ArticleType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @article_types }
    end
  end

  # GET /article_types/1
  # GET /article_types/1.xml
  def show
    @article_type = ArticleType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article_type }
    end
  end

  # GET /article_types/new
  # GET /article_types/new.xml
  def new
    @article_type = ArticleType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article_type }
    end
  end

  # GET /article_types/1/edit
  def edit
    @article_type = ArticleType.find(params[:id])
  end

  # POST /article_types
  # POST /article_types.xml
  def create
    @article_type = ArticleType.new(params[:article_type])

    respond_to do |format|
      if @article_type.save
        flash[:notice] = 'ArticleType was successfully created.'
        format.html { redirect_to(@article_type) }
        format.xml  { render :xml => @article_type, :status => :created, :location => @article_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /article_types/1
  # PUT /article_types/1.xml
  def update
    @article_type = ArticleType.find(params[:id])

    respond_to do |format|
      if @article_type.update_attributes(params[:article_type])
        flash[:notice] = 'ArticleType was successfully updated.'
        format.html { redirect_to(@article_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /article_types/1
  # DELETE /article_types/1.xml
  def destroy
    @article_type = ArticleType.find(params[:id])
    @article_type.destroy

    respond_to do |format|
      format.html { redirect_to(article_types_url) }
      format.xml  { head :ok }
    end
  end
end
