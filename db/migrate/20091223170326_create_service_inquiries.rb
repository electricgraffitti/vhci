class CreateServiceInquiries < ActiveRecord::Migration
  def self.up
    create_table :service_inquiries do |t|
      t.integer :business_type_id
      t.integer :claim_type_id
      t.integer :goal_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :service_inquiries
  end
end
