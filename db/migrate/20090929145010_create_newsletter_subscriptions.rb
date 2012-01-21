class CreateNewsletterSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :newsletter_subscriptions do |t|
      t.string :email
      t.boolean :active_subscription

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_subscriptions
  end
end
