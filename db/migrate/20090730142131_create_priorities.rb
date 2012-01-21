class CreatePriorities < ActiveRecord::Migration
  def self.up
    create_table :priorities do |t|
      t.string :priority_type

      t.timestamps
    end
  end

  def self.down
    drop_table :priorities
  end
end
