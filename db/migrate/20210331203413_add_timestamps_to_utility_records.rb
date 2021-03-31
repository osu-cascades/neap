class AddTimestampsToUtilityRecords < ActiveRecord::Migration[5.2]
  def up
    add_timestamps :utility_records, null: true
    UtilityRecord.update_all(created_at: DateTime.current, updated_at: DateTime.current)
    change_column_null :utility_records, :created_at, false
    change_column_null :utility_records, :updated_at, false
  end
  def down
    remove_timestamps :utility_records
  end
end
