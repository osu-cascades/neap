class CreateUtilitiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :utility_records do |t|
      t.integer :parent_application_id, null: false
      t.string :utility_name
      t.string :account_number
      t.string :accountholder_name
    end
  end
end
