# == Schema Information
#
# Table name: goal_types
#
#  id         :integer(4)      not null, primary key
#  goal_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GoalType < ActiveRecord::Base
end
