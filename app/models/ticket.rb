# == Schema Information
#
# Table name: tickets
#
#  id               :integer(4)      not null, primary key
#  subject          :string(255)
#  description      :text
#  due_date         :date
#  ticket_status_id :integer(4)
#  priority_id      :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

class Ticket < ActiveRecord::Base
  
  # Associations
  has_many :owner, :class_name => 'Owner'
  accepts_nested_attributes_for :owner, :allow_destroy => true
  has_one :employee, :through => :owner
  
  belongs_to :ticket_status
  belongs_to :priority
  
  has_many :ticket_assignments, :class_name => 'TicketAssignment'
  accepts_nested_attributes_for :ticket_assignments, :allow_destroy => true
  has_many :employees, :through => :ticket_assignments
  
  has_many :ticket_assets, :as => :attachable
  accepts_nested_attributes_for :ticket_assets, :allow_destroy => true
  
  has_many :ticket_updates, :class_name => 'TicketUpdate'
  accepts_nested_attributes_for :ticket_updates, :allow_destroy => true
  
  # Thinking Sphinx Indexes
  define_index do
    indexes description
    indexes subject
  end
  
  # RedCloth (textilize)
  # acts_as_textiled  :description
  
  # Validations
  validates_presence_of :subject, :description, :due_date
  
  # Named Scopes
  scope :priority_listed, order("priorities.id ASC").includes(:priority)
  scope :last_created, order("created_at DESC")
  scope :owned_tickets, lambda { |employee| where("owners.employee_id = ?", employee.id).includes(:owner) }
  scope :not_complete, where("ticket_statuses.status_type != ?", "complete").includes(:ticket_status)
  scope :complete, where("ticket_statuses.status_type = ?", "complete").includes(:ticket_status)
  scope :overdue, where("due_date < ?", Time.now).includes(:ticket_status)
  scope :assigned_tickets, lambda { |employee| where("ticket_assignments.employee_id = ?", employee.id).includes(:employees) }
  scope :open_tickets, where("ticket_statuses.status_type != ?", "closed").includes(:ticket_status)
  scope :not_closed, where("ticket_statuses.status_type != ?", "closed").includes(:ticket_status)
  
  #============================= Class Methods ==================================#
  
  #pulls the assets from the form
  # def attachments=(attachments)
  #   attachments.each do |attachment|
  #     ticket_assets.build(attachment)
  #   end
  # end
  
end
