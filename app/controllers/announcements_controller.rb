class AnnouncementsController < ApplicationController
  
  def index
    @articles = Article.type("hci_article").limit(2)
    @third_party_articles = Article.type("third_party").limit(2)
    @press_releases = Article.type("press_release").limit(2)
    @events = Event.all
  end

end
