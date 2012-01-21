class RemoveDocumentIdFromDocumentTypesAddDocumentExtensionToDocumentTypes < ActiveRecord::Migration
  def self.up
    remove_column :document_types, :document_id
    add_column :document_types, :document_extension, :string
  end

  def self.down
    remove_column :document_types, :document_extension
    add_column :document_types, :document_id, :integer
  end
end
