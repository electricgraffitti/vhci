class CreateGoalTypes < ActiveRecord::Migration
  def self.up
    create_table :goal_types do |t|
      t.string :goal_type

      t.timestamps
    end
  end

  def self.down
    drop_table :goal_types
  end
end
