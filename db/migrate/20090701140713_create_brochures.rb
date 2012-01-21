class CreateBrochures < ActiveRecord::Migration
  def self.up
    create_table :brochures do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.string :keywords
      t.integer :service_id

      t.timestamps
    end
  end

  def self.down
    drop_table :brochures
  end
end
