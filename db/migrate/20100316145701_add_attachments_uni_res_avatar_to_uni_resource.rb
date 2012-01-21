class AddAttachmentsUniResAvatarToUniResource < ActiveRecord::Migration
  def self.up
    add_column :uni_resources, :uni_res_avatar_file_name, :string
    add_column :uni_resources, :uni_res_avatar_content_type, :string
    add_column :uni_resources, :uni_res_avatar_file_size, :integer
    add_column :uni_resources, :uni_res_avatar_updated_at, :datetime
  end

  def self.down
    remove_column :uni_resources, :uni_res_avatar_file_name
    remove_column :uni_resources, :uni_res_avatar_content_type
    remove_column :uni_resources, :uni_res_avatar_file_size
    remove_column :uni_resources, :uni_res_avatar_updated_at
  end
end
