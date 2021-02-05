class CreateDeclarationOfHouseholdIncomeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :declaration_of_household_income do |t|
      t.integer :parent_application_id, null: false
      t.string :member_name
      t.money :informal_income_amount
      t.string :informal_income_source
      t.boolean :is_highschooler
    end
  end
end
