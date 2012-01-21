class AddBannerCountToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :banner_count, :integer
  end

  def self.down
    remove_column :banners, :banner_count
  end
end
