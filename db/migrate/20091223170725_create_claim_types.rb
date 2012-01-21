class CreateClaimTypes < ActiveRecord::Migration
  def self.up
    create_table :claim_types do |t|
      t.string :claim_type

      t.timestamps
    end
  end

  def self.down
    drop_table :claim_types
  end
end
