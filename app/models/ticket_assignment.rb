# == Schema Information
#
# Table name: ticket_assignments
#
#  id          :integer(4)      not null, primary key
#  ticket_id   :integer(4)
#  employee_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class TicketAssignment < ActiveRecord::Base
  
  belongs_to :employee
  belongs_to :ticket
  
end
