class AddAttachmentsTutorialVideoToTutorialVideo < ActiveRecord::Migration
  def self.up
    add_column :tutorial_videos, :tutorial_video_file_name, :string
    add_column :tutorial_videos, :tutorial_video_content_type, :string
    add_column :tutorial_videos, :tutorial_video_file_size, :integer
    add_column :tutorial_videos, :tutorial_video_updated_at, :datetime
    add_column :tutorial_videos, :tutorial_video_thumb_file_name, :string
    add_column :tutorial_videos, :tutorial_video_thumb_content_type, :string
    add_column :tutorial_videos, :tutorial_video_thumb_file_size, :integer
    add_column :tutorial_videos, :tutorial_video_thumb_updated_at, :datetime
  end

  def self.down
    remove_column :tutorial_videos, :tutorial_video_file_name
    remove_column :tutorial_videos, :tutorial_video_content_type
    remove_column :tutorial_videos, :tutorial_video_file_size
    remove_column :tutorial_videos, :tutorial_video_updated_at
    remove_column :tutorial_videos, :tutorial_video_thumb_file_name
    remove_column :tutorial_videos, :tutorial_video_thumb_content_type
    remove_column :tutorial_videos, :tutorial_video_thumb_file_size
    remove_column :tutorial_videos, :tutorial_video_thumb_updated_at
  end
end