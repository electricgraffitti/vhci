class CreateCoverflows < ActiveRecord::Migration
  def self.up
    create_table :coverflows do |t|
      t.integer :cflow_id
      t.string :cflow_type
      t.timestamps
    end
  end

  def self.down
    drop_table :coverflows
  end
end
