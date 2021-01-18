class HouseholdMemberIncome < ActiveRecord::Migration[5.2]
  def change
    create_table :household_member_income_table do |t|
      t.integer :parent_application_id, null: false
      t.string :name
      t.string :income_type
    end
  end
end
