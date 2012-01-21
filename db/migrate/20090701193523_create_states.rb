class CreateStates < ActiveRecord::Migration
  def self.up
    create_table    :states,          :force    => true do |t|      
      t.string      :abbreviation,    :limit    => 2
      t.string      :full_name
      t.boolean     :display,         :default  => true
      t.integer     :created_by
      t.integer     :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end