class AddPermalinkToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :permalink, :string
  end

  def self.down
    remove_column :videos, :permalink
  end
end
