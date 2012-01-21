class AddClaimTypeToServices < ActiveRecord::Migration
  def self.up
    add_column :services, :claim_type_id, :integer
  end

  def self.down
    remove_column :services, :claim_type_id
  end
end
