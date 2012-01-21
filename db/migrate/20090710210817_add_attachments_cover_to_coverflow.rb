class AddAttachmentsCoverToCoverflow < ActiveRecord::Migration
  def self.up
    add_column :coverflows, :cover_file_name, :string
    add_column :coverflows, :cover_content_type, :string
    add_column :coverflows, :cover_file_size, :integer
    add_column :coverflows, :cover_updated_at, :datetime
  end

  def self.down
    remove_column :coverflows, :cover_file_name
    remove_column :coverflows, :cover_content_type
    remove_column :coverflows, :cover_file_size
    remove_column :coverflows, :cover_updated_at
  end
end
