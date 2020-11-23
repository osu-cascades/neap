class CreateEnergyApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :energy_applications do |t|
      t.int :clientID
    end
  end
end
