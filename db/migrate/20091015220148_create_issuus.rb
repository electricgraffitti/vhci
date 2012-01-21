class CreateIssuus < ActiveRecord::Migration
  def self.up
    create_table :issuus do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :issuus
  end
end
