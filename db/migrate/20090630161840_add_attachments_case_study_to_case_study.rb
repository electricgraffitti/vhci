class AddAttachmentsCaseStudyToCaseStudy < ActiveRecord::Migration
  def self.up
    add_column :case_studies, :case_study_file_name, :string
    add_column :case_studies, :case_study_content_type, :string
    add_column :case_studies, :case_study_file_size, :integer
    add_column :case_studies, :case_study_updated_at, :datetime
  end

  def self.down
    remove_column :case_studies, :case_study_file_name
    remove_column :case_studies, :case_study_content_type
    remove_column :case_studies, :case_study_file_size
    remove_column :case_studies, :case_study_updated_at
  end
end
