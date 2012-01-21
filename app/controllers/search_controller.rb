class SearchController < ApplicationController
  
  def index
    # @services = Service.search params[:search]
    # @articles = Article.search params[:search]
    # @documents = Document.search params[:search]
    # @events = Event.search params[:search]
    # @videos = Video.search params[:search]
    
    @services = Service.all.paginate(:per_page => 6, :page => params[:page]) 
    @articles = Article.paginate(:per_page => 4, :page => params[:page]) 
    @documents = Document.paginate(:per_page => 4, :page => params[:page]) 
    @events = Event.paginate(:per_page => 4, :page => params[:page]) 
    @videos = Video.paginate(:per_page => 4, :page => params[:page]) 
  end

end
