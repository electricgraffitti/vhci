class AddIndexsToTables < ActiveRecord::Migration
  def self.up
    
    add_index :articles, :article_type_id
    add_index :brochures, :service_id
    add_index :case_studies, :service_id
    add_index :documents, :document_type_id
    add_index :employees, :department_id
    add_index :employees, :role_id
    add_index :owners, :ticket_id
    add_index :owners, :employee_id
    add_index :ticket_assignments, :ticket_id
    add_index :ticket_assignments, :employee_id
    add_index :ticket_updates, :ticket_id
    add_index :ticket_updates, :employee_id
    add_index :tickets, :ticket_status_id
    add_index :tickets, :priority_id
    
    
  end

  def self.down
    
    remove_index :articles, :article_type_id
    remove_index :brochures, :service_id
    remove_index :case_studies, :service_id
    remove_index :documents, :document_type_id
    remove_index :employees, :department_id
    remove_index :employees, :role_id
    remove_index :owners, :ticket_id
    remove_index :owners, :employee_id
    remove_index :ticket_assignments, :ticket_id
    remove_index :ticket_assignments, :employee_id
    remove_index :ticket_updates, :ticket_id
    remove_index :ticket_updates, :employee_id
    remove_index :tickets, :ticket_status_id
    remove_index :tickets, :priority_id
    
  end
end
