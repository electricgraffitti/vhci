class ApplicationMailer < ActionMailer::Base
  
    # layout 'ticket_mailer'
  
  def contact_mailer(contact, sent_at = Time.now)
      recipients    "bhanson@hcinsight.com"
      from          "HealthCare Insight :: Contact Us"
      subject       "HCI Contact Us Request"
      body          :contact => contact, :sent_on => sent_at
  end
  
  def invite_mailer(params, sent_at = Time.now)
      recipients    params[:friend_invite][:receiver_email]
      from          "HealthCare Insight :: ClaimSaver Webinar Series"
      subject       params[:friend_invite][:sender_name] + " has invited you to a free webinar."
      body          :layout => false
  end
  
  def new_ticket_mailer(params)
    
    # need to parse the params
    @employees = Employee.find(:all, :conditions => { :id => params[:ticket][:employee_ids]} )
    @owner = Employee.find(params[:ticket][:owner_attributes]["0"][:employee_id])
    @status = TicketStatus.find_by_id(params[:ticket][:ticket_status_id])
    @priority = Priority.find_by_id(params[:ticket][:priority_id])
    emails = []
    @employees.each do |employee|
      emails << employee.email
    end
    
    # This is what gets set in the mailer
    recipients    emails
    from          "HCI Internal Ticket - #{@owner.fullname}"
    subject       "New Ticket: #{params[:ticket][:subject]}"
    body          :params => params, :owner => @owner, :employees => @employees, :status => @status, :priority => @priority
    # content_type  "multipart/alternative"
    # attachment :content_type => "image/jpeg",  :body => File.read("an-image.jpg")
    
    
  end
  
  def update_ticket_mailer(params)
    # need to parse the params
    @ticket = Ticket.find(params[:ticket_update][:ticket_id])
    @owner = Employee.find(params[:ticket_update][:employee_id])
    @update = params[:ticket_update][:comment]
    @status = @ticket.ticket_status
    @priority = @ticket.priority
    
    @employees = @ticket.employees
    emails = []
    @employees.each do |employee|
      emails << employee.email
    end
    
    # This is what gets set in the mailer
    recipients    emails
    from          "HCI Internal Ticket Update #{@owner.fullname}"
    subject       "Ticket Update: #{@ticket.subject} - #{@owner.fullname}"
    body          :params => params, :ticket => @ticket, :owner => @owner, :employees => @employees, :status => @status, :priority => @priority, :update => @update
  end
  
end