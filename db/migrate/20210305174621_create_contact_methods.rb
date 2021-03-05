class CreateContactMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_methods do |t|
      t.int :parent_application
      t.string :first_name
      t.string :last_name
      t.string :contact_method
      t.string :contact_info

      t.timestamps
    end
  end
end
