# == Schema Information
#
# Table name: newsletter_subscriptions
#
#  id                  :integer(4)      not null, primary key
#  email               :string(255)
#  active_subscription :boolean(1)
#  created_at          :datetime
#  updated_at          :datetime
#

class NewsletterSubscription < ActiveRecord::Base
end
