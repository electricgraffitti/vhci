class AddLandingLinkToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :landing_link, :string
  end

  def self.down
    remove_column :services, :landing_link
  end
end
