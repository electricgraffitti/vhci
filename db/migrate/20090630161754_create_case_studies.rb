class CreateCaseStudies < ActiveRecord::Migration
  def self.up
    create_table :case_studies do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.string :keywords
      t.integer :service_id

      t.timestamps
    end
  end

  def self.down
    drop_table :case_studies
  end
end
