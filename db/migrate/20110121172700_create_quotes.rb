class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.integer :service_id
      t.string :page
      t.string :line_1
      t.string :line_2
      t.string :line_3
      t.string :author
      t.integer :line_count

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
