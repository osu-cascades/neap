class AddSubmissionDateToEnergyApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :energy_applications, :submission_date, :datetime
  end
end
