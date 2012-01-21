class AddButtonsToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :button_color, :string
    add_column :banners, :button_position, :string
    add_column :banners, :button_text, :string
    add_column :banners, :button_url, :string
  end

  def self.down
    remove_column :banners, :button_url
    remove_column :banners, :button_text
    remove_column :banners, :button_position
    remove_column :banners, :button_color
  end
end
