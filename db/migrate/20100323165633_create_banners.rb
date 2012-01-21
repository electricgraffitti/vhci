class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :headline
      t.text :content
      t.boolean :secondary_banners

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
