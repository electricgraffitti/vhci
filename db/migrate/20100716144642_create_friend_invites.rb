class CreateFriendInvites < ActiveRecord::Migration
  def self.up
    create_table :friend_invites do |t|
      t.string :sender_name
      t.string :receiver_email

      t.timestamps
    end
  end

  def self.down
    drop_table :friend_invites
  end
end
