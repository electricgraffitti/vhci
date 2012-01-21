class CreateVideoTypes < ActiveRecord::Migration
  def self.up
    create_table :video_types do |t|
      t.string :video_type

      t.timestamps
    end
  end
  def self.down
    drop_table :video_types
  end
end
