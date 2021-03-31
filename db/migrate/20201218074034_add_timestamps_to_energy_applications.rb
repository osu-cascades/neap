class AddTimestampsToEnergyApplications < ActiveRecord::Migration[5.2]
  def up
    add_timestamps :energy_applications
  end
  def down
    remove_timestamps :energy_applications
  end
end
