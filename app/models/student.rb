# == Schema Information
#
# Table name: students
#
#  id                :integer(4)      not null, primary key
#  username          :string(255)
#  first_name        :string(255)
#  last_name         :string(255)
#  email             :string(255)
#  phone             :string(255)
#  company           :string(255)
#  city              :string(255)
#  state_id          :integer(4)
#  zip               :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Student < ActiveRecord::Base
  acts_as_authentic
  
  # Associations
  belongs_to :state
  
  
  # Thinking Sphinx Indexes
  # define_index do
  #   indexes email
  #   indexes first_name
  #   indexes last_name
  # end
  
  # RedCloth (textilize)
  # acts_as_textiled  :description
  
  # Validations
  validates_presence_of :username, :first_name, :last_name, :email, :phone, :city, :state_id, :zip
  
  # PaperClip
  has_attached_file :student_pic, 
                    :styles => { :medium => "200x200>", :small => "100x100>", :thumb => "70x70>", :tiny => "25x25>" },
                    :url => "/student_pics/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/student_pics/:id/:style_:basename.:extension"
  # Attrs
  attr_protected :student_pic_file_name, :student_pic_content_type, :student_pic_file_size
  
  # Scopes
  scope :last_created, order("created_at DESC")
  
  #============================= Class Methods ==================================#
  
  # Sets Permalink Routes
  def fullname
    fullname = self.first_name + " " + self.last_name
  end
  
  # Sets Permalink Routes
  def to_param
    "#{id}-#{self.first_name.downcase}-#{self.last_name.downcase}"
  end

end
