# == Schema Information
#
# Table name: service_bullets
#
#  id           :integer(4)      not null, primary key
#  service_id   :integer(4)
#  bullet_point :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ServiceBullet < ActiveRecord::Base
  
  # associations
  belongs_to :service
  
  # validations
  validates_presence_of :bullet_point
  # named_scopes
  
  #--------------Class Methods--------------#
  
  
  
end
