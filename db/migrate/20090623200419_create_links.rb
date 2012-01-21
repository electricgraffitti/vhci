class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :title
      t.text :description
      t.string :link_url
      t.string :keywords
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
