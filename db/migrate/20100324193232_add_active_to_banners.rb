class AddActiveToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :active_banner, :boolean
  end

  def self.down
    remove_column :banners, :active_banner
  end
end
