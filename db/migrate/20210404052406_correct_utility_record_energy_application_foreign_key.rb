class CorrectUtilityRecordEnergyApplicationForeignKey < ActiveRecord::Migration[5.2]
  def up
    change_column :utility_records, :parent_application_id, :bigint
    rename_column :utility_records, :parent_application_id, :energy_application_id
    add_foreign_key :utility_records, :energy_applications, column: :energy_application_id
  end

  def down
    remove_foreign_key :utility_records, column: :energy_application_id
    rename_column :utility_records, :energy_application_id, :parent_application_id
    change_column :utility_records, :parent_application_id, :integer
  end
end
