class CreateHouseholdMemberTable < ActiveRecord::Migration[5.2]
  def change
    create_table :household_members do |t|
      t.integer :parent_application_id, null: false
      t.string :name
      t.date :dob
      t.string :ssn
      t.string :gender
      t.boolean :hispanic
      t.string :race
      t.boolean :tribal_member
      t.string :education
      t.boolean :disabled
      t.boolean :veteran
      t.boolean :homebound
      t.boolean :snap
      t.boolean :ohp
      t.string :other_insurance
    end
  end
end
