class RedirectsController < ApplicationController
  
  def cost_reduction
    redirect_to nucleus_path
  end
  
  def fraud_software
    redirect_to nucleus_path
  end
  
  def ahip_postcard
    redirect_to "http://www2.hcinsight.com/l/1492/2010-05-18/H4NLB"
  end
  
  def nadp_postcard
    redirect_to "http://www2.hcinsight.com/l/1492/2010-08-16/I3Q09"
  end
  
  def linkedin_webinars
    redirect_to "http://www2.hcinsight.com/l/1492/2010-09-17/ID0Q9"
  end
  
  def lounge_vip
    redirect_to "http://www2.hcinsight.com/l/1492/2010-09-29/INNTX"
  end
  
end
