class CorrectHouseholdMembersEnergyApplicationForeignKey < ActiveRecord::Migration[5.2]
  def up
    change_column :household_members, :parent_application_id, :bigint
    rename_column :household_members, :parent_application_id, :energy_application_id
    add_foreign_key :household_members, :energy_applications, column: :energy_application_id
  end

  def down
    remove_foreign_key :household_members, column: :energy_application_id
    rename_column :household_members, :energy_application_id, :parent_application_id
    change_column :household_members, :parent_application_id, :integer
  end
end
