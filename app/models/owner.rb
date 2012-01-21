# == Schema Information
#
# Table name: owners
#
#  id          :integer(4)      not null, primary key
#  ticket_id   :integer(4)
#  employee_id :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Owner < ActiveRecord::Base
  
  belongs_to :employee
  belongs_to :ticket
  
end
