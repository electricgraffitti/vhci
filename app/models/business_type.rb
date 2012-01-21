# == Schema Information
#
# Table name: business_types
#
#  id            :integer(4)      not null, primary key
#  business_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class BusinessType < ActiveRecord::Base
end
