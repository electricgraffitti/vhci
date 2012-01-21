# This Maps to the Media Lab pages
class ResourcesController < ApplicationController
  
  def index
    @articles = Article.no_press.paginate :per_page => 6, :page => params[:page]
    @documents = Document.brochures
    @press_releases = Article.type('press_release').limit(3)
    
    @videos = Video.filtered_type('Webinar').limit(4)
    @webinar = Video.type('Webinar').last
    @events = Event.upcoming_events.limit(1).last_created
  end

end
