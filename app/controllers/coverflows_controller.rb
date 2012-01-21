class CoverflowsController < ApplicationController
  def index
    @coverflows = Coverflow.all
    
    respond_to do |format|
      format.html
      format.xml
    end
  end

end
