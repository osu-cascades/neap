class AddSubmissionDateToEnergyApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :energy_applications, :submission_date, :datetime
    add_column :energy_applications, :confirmation_date, :datetime
    add_column :energy_applications, :contact_type, :text
    add_column :energy_applications, :contact_info, :text
  end
end
