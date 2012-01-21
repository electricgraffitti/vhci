class CreateBusinessTypes < ActiveRecord::Migration
  def self.up
    create_table :business_types do |t|
      t.string :business_type

      t.timestamps
    end
  end

  def self.down
    drop_table :business_types
  end
end
