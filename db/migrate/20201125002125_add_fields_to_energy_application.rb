class AddFieldsToEnergyApplication < ActiveRecord::Migration[5.2]
  def up
    remove_column :energy_applications, :clientID
    add_reference :energy_applications, :user, foreign_key: true
    add_column :energy_applications, :phone_number, :string
    add_column :energy_applications, :address, :string
    add_column :energy_applications, :address2, :string
    add_column :energy_applications, :city, :string
    add_column :energy_applications, :county, :string
    add_column :energy_applications, :zip, :string
  end
  def down
    remove_reference :energy_applications, :user
    remove_column :energy_applications, :phone_number, :string
    remove_column :energy_applications, :address, :string
    remove_column :energy_applications, :address2, :string
    remove_column :energy_applications, :city, :string
    remove_column :energy_applications, :county, :string
    remove_column :energy_applications, :zip, :string
    add_column :energy_applications, :clientID, :integer
  end
end
