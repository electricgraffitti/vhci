class AddUrlToAdvertisements < ActiveRecord::Migration
  def self.up
    add_column :advertisements, :link_url, :string
  end

  def self.down
    remove_column :advertisements, :link_url
  end
end
