class CreateTicketAssets < ActiveRecord::Migration
  def self.up
    create_table :ticket_assets do |t|
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_assets
  end
end
