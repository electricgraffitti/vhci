class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :title
      t.text :description
      t.string :ad_type
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
