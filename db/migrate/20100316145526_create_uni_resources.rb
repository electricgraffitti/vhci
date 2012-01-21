class CreateUniResources < ActiveRecord::Migration
  def self.up
    create_table :uni_resources do |t|
      t.string :title
      t.text :description
      t.boolean :featured
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :uni_resources
  end
end
