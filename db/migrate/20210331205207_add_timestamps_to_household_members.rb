class AddTimestampsToHouseholdMembers < ActiveRecord::Migration[5.2]
  def up
    add_timestamps :household_members, null: true
    HouseholdMember.update_all(created_at: DateTime.current, updated_at: DateTime.current)
    change_column_null :household_members, :created_at, false
    change_column_null :household_members, :updated_at, false
  end
  def down
    remove_timestamps :household_members
  end
end
