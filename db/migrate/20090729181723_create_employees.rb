class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :department_id
      t.string :ext
      t.string :home_phone
      t.string :cell_phone
      t.string :home_fax
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
