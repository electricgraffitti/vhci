class PagesController < ApplicationController
  
  def index
    @banner_size = "large"
    @quote = Quote.page_quote("home").last
  end

  def about
    
    @quote = Quote.page_quote('about').last
    
  end

  def public_sector
    @services = Service.all
    @quote = Quote.page_quote('public').last
  end

  def private_sector
    @services = Service.all
    @quote = Quote.page_quote('private').last
  end

  def property_casualty
    @services = Service.all
    @quote = Quote.page_quote('property').last
  end

  def careers
    @banner_size = "large"
  end

  def social_media
    @banner_size = "large"
  end

  def press_kit
    @banner_size = "large"
  end

  def partner
    @quote = Quote.page_quote('property').last
  end

  def accreditations
    @quote = Quote.page_quote('accreditations').last
  end

  def nucleus
    @banner_size = "large"
  end

  def markets
    @quote = Quote.page_quote('markets').last
    
  end
  
  def privacy_policy
    @articles = Article.no_press.limit(5)
    @press_releases = Article.type('press_release').limit(5)
    @events = Event.upcoming_events.limit(1).last_created
    @advertisements = Advertisement.current_list.limit(2).order_list
  end

end
