class CreateTutorialVideos < ActiveRecord::Migration
  def self.up
    create_table :tutorial_videos do |t|
      t.string :title
      t.text :description
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorial_videos
  end
end
