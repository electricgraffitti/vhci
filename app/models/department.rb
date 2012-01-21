# == Schema Information
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base
end
