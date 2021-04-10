class ChangeEnergyApplicationTextFieldsToString < ActiveRecord::Migration[5.2]
  def up
    change_table :energy_applications do |t|
      t.change :first_name, :string
      t.change :first_name, :string
      t.change :last_name, :string
      t.change :mailing_address_street, :string
      t.change :mailing_address_city, :string
      t.change :mailing_address_state, :string
      t.change :mailing_address_zip, :string
      t.change :mailing_address_county, :string
      t.change :type_of_dwelling, :string
      t.change :residence_status, :string
      t.change :types_of_heat, :string, array: true, default: []
      t.change :primary_heat_source, :string
      t.change :secondary_heat_source, :string
      t.change :utility_company, :string
      t.change :household_member_types_of_income, :string, array: true, default: []
      t.change :utility_names, :string, array: true, default: []
      t.change :utility_account_numbers, :string, array: true, default: []
      t.change :utility_account_names, :string, array: true, default: []
      t.change :how_necessities_are_paid, :string
      t.change :covid_other_situation, :string
      t.change :covid_expenses, :string
      t.change :phone_type, :string
      t.change :household_type, :string
      t.change :email_address, :string
      t.change :contact_type, :string
      t.change :contact_info, :string
    end
  end

  def down
    change_table :energy_applications do |t|
      t.change :first_name, :text
      t.change :first_name, :text
      t.change :last_name, :text
      t.change :mailing_address_street, :text
      t.change :mailing_address_city, :text
      t.change :mailing_address_state, :text
      t.change :mailing_address_zip, :text
      t.change :mailing_address_county, :text
      t.change :type_of_dwelling, :text
      t.change :residence_status, :text
      t.change :types_of_heat, :text, array: true, default: []
      t.change :primary_heat_source, :text
      t.change :secondary_heat_source, :text
      t.change :utility_company, :text
      t.change :household_member_types_of_income, :text, array: true, default: []
      t.change :utility_names, :text, array: true, default: []
      t.change :utility_account_numbers, :text, array: true, default: []
      t.change :utility_account_names, :text, array: true, default: []
      t.change :how_necessities_are_paid, :text
      t.change :covid_other_situation, :text
      t.change :covid_expenses, :text
      t.change :phone_type, :text
      t.change :household_type, :text
      t.change :email_address, :text
      t.change :contact_type, :text
      t.change :contact_info, :text
    end
  end
end
