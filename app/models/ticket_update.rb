# == Schema Information
#
# Table name: ticket_updates
#
#  id          :integer(4)      not null, primary key
#  comment     :text
#  employee_id :integer(4)
#  ticket_id   :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class TicketUpdate < ActiveRecord::Base

  belongs_to :employee
  belongs_to :ticket, :class_name => 'Ticket'
  accepts_nested_attributes_for :ticket, :allow_destroy => true
  
  has_many :ticket_assets, :as => :attachable
  accepts_nested_attributes_for :ticket_assets, :allow_destroy => true
  
  # RedCloth (textilize)
  # acts_as_textiled  :comment
  
  # Validations
  validates_presence_of :comment
  
  # Scopes
  scope :listed, order("created_at DESC")
  
  #============================= Class Methods ==================================#
  
  #pulls the assets from the form
  # def attachments=(attachments)
  #   attachments.each do |attachment|
  #     ticket_assets.build(attachment)
  #   end
  # end
  
end
