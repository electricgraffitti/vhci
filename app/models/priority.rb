# == Schema Information
#
# Table name: priorities
#
#  id            :integer(4)      not null, primary key
#  priority_name :string(255)
#  priority_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Priority < ActiveRecord::Base
  
  has_many :tickets
  
end
