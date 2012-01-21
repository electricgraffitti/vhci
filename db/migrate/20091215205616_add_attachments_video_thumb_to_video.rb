class AddAttachmentsVideoThumbToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :video_thumb_file_name, :string
    add_column :videos, :video_thumb_content_type, :string
    add_column :videos, :video_thumb_file_size, :integer
    add_column :videos, :video_thumb_updated_at, :datetime
  end

  def self.down
    remove_column :videos, :video_thumb_file_name
    remove_column :videos, :video_thumb_content_type
    remove_column :videos, :video_thumb_file_size
    remove_column :videos, :video_thumb_updated_at
  end
end
