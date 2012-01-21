# == Schema Information
#
# Table name: ticket_statuses
#
#  id          :integer(4)      not null, primary key
#  status_name :string(255)
#  status_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class TicketStatus < ActiveRecord::Base
  
  # Associations
  has_many :tickets
  
  # Named Scopes
  scope :contributor_update, where('status_type != ? AND status_type != ?', "open", "closed")
  scope :owner_update, where('status_type != ?', "open")
  
end
