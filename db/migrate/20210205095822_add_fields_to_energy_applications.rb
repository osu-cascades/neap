class AddFieldsToEnergyApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :energy_applications, :first_name, :text
    add_column :energy_applications, :last_name, :text
    add_column :energy_applications, :household_member_names, :text, array: true, default: []
    add_column :energy_applications, :household_member_birthdates, :date, array: true, default: []
    add_column :energy_applications, :household_member_ssids, :text, array: true, default: []
    add_column :energy_applications, :household_member_genders, :text, array: true, default: []
    add_column :energy_applications, :household_members_who_are_hispanic, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_races, :text, array: true, default: []
    add_column :energy_applications, :household_members_in_or_tribe, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_educations, :text, array: true, default: []
    add_column :energy_applications, :household_members_with_disabilities, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_veterans, :boolean, array: true, default: []
    add_column :energy_applications, :household_members_who_are_homebound, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_snaps, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_ohps, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_other_medical_insurances, :text, array: true, default: []
    add_column :energy_applications, :mailing_address_street, :text
    add_column :energy_applications, :mailing_address_city, :text
    add_column :energy_applications, :mailing_address_state, :text
    add_column :energy_applications, :mailing_address_zip, :text
    add_column :energy_applications, :mailing_address_county, :text
    add_column :energy_applications, :type_of_dwelling, :text
    add_column :energy_applications, :residence_status, :text
    add_column :energy_applications, :types_of_heat, :text, array: true, default: []
    add_column :energy_applications, :primary_heat_source, :text
    add_column :energy_applications, :secondary_heat_source, :text
    add_column :energy_applications, :utility_company, :text
    add_column :energy_applications, :household_member_types_of_income, :text, array: true, default: []
    add_column :energy_applications, :household_member_proofs_of_income, :text, array: true, default: []
    add_column :energy_applications, :household_member_income_frequencies, :text, array: true, default: []
    add_column :energy_applications, :household_member_income_amounts, :text, array: true, default: []
    add_column :energy_applications, :household_member_annual_incomes, :text, array: true, default: []
    add_column :energy_applications, :utility_account_status, :text
    add_column :energy_applications, :utility_names, :text, array: true, default: []
    add_column :energy_applications, :utility_account_numbers, :text, array: true, default: []
    add_column :energy_applications, :utility_account_names, :text, array: true, default: []
    add_column :energy_applications, :utility_vendor_amounts, :text, array: true, default: []
    add_column :energy_applications, :utility_direct_amount, :text, array: true, default: []
    add_column :energy_applications, :utility_total_auth_amount, :text, array: true, default: []
    add_column :energy_applications, :utility_matrix_energy_type, :text, array: true, default: []
    add_column :energy_applications, :household_members_over_18_without_income, :boolean, array: true, default: []
    add_column :energy_applications, :household_member_informal_incomes_last_month, :text, array: true, default: []
    add_column :energy_applications, :household_member_informal_income_sources, :text, array: true, default: []
    add_column :energy_applications, :household_members_in_high_school, :boolean, array: true, default: []
    add_column :energy_applications, :how_necessities_are_paid, :text
    add_column :energy_applications, :household_impacted_by_covid, :boolean
    add_column :energy_applications, :covid_loss_of_employment, :boolean
    add_column :energy_applications, :covid_reduction_of_hours, :boolean
    add_column :energy_applications, :covid_vulnerable_population, :boolean
    add_column :energy_applications, :covid_loss_of_childcare, :boolean
    add_column :energy_applications, :covid_other_situation, :text
    add_column :energy_applications, :covid_expenses, :text
  end
end
