class UniversityController < ApplicationController
  
  layout "insightu"
  
  def index
    @iuresources = UniResource.featured.limit(3)
    @advertisements = Advertisement.current_list.limit(1).order_list
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
      format.rss { render :rss => @articles }
      format.atom
    end
  end
  
  def iu_resources
    @advertisements = Advertisement.current_list.limit(1).order_list
    respond_to do |format|
      format.html { render :layout => "insightu_2"}
      format.xml  { render :xml => @articles }
      format.rss { render :rss => @articles }
      format.atom
    end
  end
  
  def iu_services
    @advertisements = Advertisement.current_list.limit(1).order_list
  end

end
