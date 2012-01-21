class ClaimSaversController < ApplicationController
  def index
    @videos = Video.type("Webinar")
    @press_releases = Article.type('press_release').limit(5)
    @events = Event.upcoming_events.limit(1).last_created
    @advertisements = Advertisement.current_list.limit(2).order_list
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  def show
  end

end
