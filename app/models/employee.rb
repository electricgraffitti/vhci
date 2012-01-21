# == Schema Information
#
# Table name: employees
#
#  id                  :integer(4)      not null, primary key
#  username            :string(255)
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  last_login_at       :datetime
#  department_id       :integer(4)
#  ext                 :string(255)
#  home_phone          :string(255)
#  cell_phone          :string(255)
#  home_fax            :string(255)
#  role_id             :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  persistence_token   :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#

class Employee < ActiveRecord::Base
  acts_as_authentic
  
  belongs_to :role
  belongs_to :department
  belongs_to :owner
  has_many :ticket_updates
  has_many :ticket_assignments
  
  has_many :tickets, :through => :ticket_assignments
  # has_many :assets, :as => :attachable
  # has_many :tickets, :class_name => 'Ticket'
  # accepts_nested_attributes_for :tickets, :allow_destroy => true
  
  # Thinking Sphinx Indexes
  define_index do
    indexes email
    indexes first_name
    indexes last_name
  end
  
  # # RedCloth (textilize)
  # acts_as_textiled  :description
  
  # Validations
  validates_presence_of :username, :first_name, :last_name, :email, :ext
  
  # PaperClip
  has_attached_file :avatar, 
                    :styles => { :medium => "200x200>", :small => "100x100>", :thumb => "70x70>", :tiny => "25x25>" },
                    :url => "/avatars/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/avatars/:id/:style_:basename.:extension"
  # Attrs
  attr_protected :avatar_file_name, :avatar_content_type, :avatar_file_size
  
  # Named Scopes
  scope :last_created, order("created_at DESC")
  scope :department, lambda { |department| where('departments.name = ?', department).includes(:department) }
  
  # named_scope :open_ticket, :conditions => ['ticket_status.status_type != ?', "closed"]
  
  #============================= Class Methods ==================================#
  
  # Sets Permalink Routes
  def fullname
    fullname = self.first_name + " " + self.last_name
  end
  
  # Sets Permalink Routes
  def to_param
    "#{id}-#{self.first_name.downcase}-#{self.last_name.downcase}"
  end
  
  # this has been set as well in the application controller as employee_admin? for use in controllers
  def is_admin?
    role.role_type == ("admin" || "super_user")
  end
  
  def self.owned_tickets(employee)
    Ticket.find(:all, :include => :owner, :conditions => ['owners.employee_id = ?', employee.id])
  end
  
end
