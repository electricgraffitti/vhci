class ContactsController < ApplicationController
  
  def contact_us
    @banner_size = "large"
  end
  
  def contacts_mailer
    @banner_size = "large"
    # raise params.to_yaml
    #grab the params to pass to the redirect
    @form = params
    
    contactus = ApplicationMailer.create_contact_mailer(params)
    contactus.set_content_type("text/html")
    ApplicationMailer.deliver(contactus)
      flash[:notice] = "Your Message has been sent."
      respond_to do |format|
        format.html {
          render :partial =>  'contacts/contact_thank_you', 
                             :layout => "layout2", 
                             :locals => {:form => @form} }
        format.js { }
      end
  end
  
  def thank_you
    @banner_size = "large"
    @form = params
    respond_to do |format|
      format.html { render :layout => "layout5"}
    end
  end
  
end
