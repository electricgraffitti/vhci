class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.integer :document_type_id
      t.string :keywords
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
