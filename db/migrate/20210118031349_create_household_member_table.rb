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
      t.boolean :or_tribe
      t.string :education
      t.boolean :disabled
      t.boolean :veteran
      t.boolean :homebound
      t.boolean :snap
      t.boolean :ohp
      t.string :other_insurance
      t.string :income_type
      t.boolean :over_18_no_formal_income
      t.decimal :informal_income_amount
      t.string :informal_income_source
      t.boolean :in_high_school
      t.string :type_of_income
    end
  end
end
