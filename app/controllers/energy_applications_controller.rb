class EnergyApplicationsController < ApplicationController

  def index
    @energy_applications = current_user.energy_applications
  end

  def show
    @energy_application = EnergyApplication.find(params[:id])
  end

  def edit
    @energy_application = EnergyApplication.find(params[:id])
  end

  def update
    @energy_application = EnergyApplication.find(params[:id])
    @energy_application.update(energy_application_params)
    redirect_to energy_application_path
  end

  def new
    @energy_application = EnergyApplication.new
  end

  def create
    @energy_application = EnergyApplication.new(energy_application_params)
    @energy_application.user_id = current_user[:id]
    test_val = retreive_dropdown_info(params[:energy_application], "household_member_gender", 8)
    puts "Test Value:"
    puts test_val
    Error
    @energy_application.save
    redirect_to energy_applications_path
  end

  def destroy
    @energy_application = EnergyApplication.find(params[:id])
    @energy_application.destroy
    redirect_to energy_applications_url
  end

private

  def energy_application_params
    params.require(:energy_application).permit(:first_name, :last_name, :phone_number, :phone_type, :address, :address2, :city, :county, :zip, :mailing_address_street, :mailing_address_city, :mailing_address_county, :mailing_address_state, :mailing_address_zip, :how_necessities_are_paid, :household_type, :household_member_names, :household_member_birthdates, :household_member_ssids, :household_member_genders, :household_members_who_are_hispanic, :household_member_races, :household_members_in_or_tribe, :household_member_educations, :household_members_with_disabilities, :household_member_veterans, :household_members_who_are_homebound, :household_member_snaps, :household_member_ohps, :household_member_other_medical_insurances, :household_member_types_of_income, :household_member_proofs_of_income, :household_member_income_frequencies, :household_member_income_amounts, :household_member_annual_incomes, :household_members_over_18_without_income, :household_member_informal_incomes_last_month, :household_member_informal_income_sources, :household_members_in_high_school, :type_of_dwelling, :residence_status, :types_of_heat, :primary_heat_source, :secondary_heat_source, :utility_name, :utility_account_status, :utility_names, :utility_account_numbers, :utility_account_names, :utility_vendor_amounts, :utility_direct_amount, :utility_total_auth_amount, :utility_matrix_energy_type, :household_impacted_by_covid, :covid_loss_of_employment, :covid_vulnerable_population, :covid_reduction_of_hours, :covid_loss_of_childcare, :covid_other_situation, :covid_expenses)
  end

  def retreive_dropdown_info(parameter_list, element_name, number_of_elements)
    final_index = number_of_elements - 1
    return_arr = []
    for i in 0..final_index
      name_string = "%s_%d" % [element_name, i]
      return_arr.push(parameter_list[name_string])
    end
    return return_arr
  end

end
