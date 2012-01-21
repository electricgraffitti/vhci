class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :video_type_id
      t.boolean :third_party
      t.string :third_party_url

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
