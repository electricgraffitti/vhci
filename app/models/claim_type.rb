# == Schema Information
#
# Table name: claim_types
#
#  id         :integer(4)      not null, primary key
#  claim_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ClaimType < ActiveRecord::Base
  
  has_many :services
  
end
