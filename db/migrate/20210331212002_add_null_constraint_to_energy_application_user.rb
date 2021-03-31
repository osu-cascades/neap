class AddNullConstraintToEnergyApplicationUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null :energy_applications, :user_id, false
  end
end
