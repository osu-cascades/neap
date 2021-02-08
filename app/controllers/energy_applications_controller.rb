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
    parse_dropdown_data_to_model_object(@energy_application, params)
    parse_dropdown_data_to_model_object(@energy_application, params)
    # verifying output
    @energy_application.save
    puts "Array test:"
    puts @energy_application.household_member_ohps
    puts @energy_application.household_member_other_medical_insurances
    puts @energy_application
    Error
    redirect_to energy_applications_path
  end

  def destroy
    @energy_application = EnergyApplication.find(params[:id])
    @energy_application.destroy
    redirect_to energy_applications_url
  end

private

  def energy_application_params
    params.require(:energy_application).permit(:first_name, :last_name, :phone_number, :phone_type, \
      :address, :address2, :city, :county, :zip, :mailing_address_street, :mailing_address_city, \
      :mailing_address_county, :mailing_address_state, :mailing_address_zip, :how_necessities_are_paid, \
      :household_type, :household_member_names, :household_member_birthdates, :household_member_ssids, \
      :household_member_genders, :household_members_who_are_hispanic, :household_member_races, \
      :household_members_in_or_tribe, :household_member_educations, :household_members_with_disabilities, \
      :household_member_veterans, :household_members_who_are_homebound, :household_member_snaps, \
      :household_member_ohps, :household_member_other_medical_insurances, :household_member_types_of_income, \
      :household_members_over_18_without_income, :household_member_informal_incomes_last_month, \
      :household_member_informal_income_sources, :household_members_in_high_school, :type_of_dwelling, \
      :residence_status, :types_of_heat, :primary_heat_source, :secondary_heat_source, :utility_name, \
      :utility_names, :utility_account_numbers, :utility_account_names, \
      :household_impacted_by_covid, :covid_loss_of_employment, \
      :covid_vulnerable_population, :covid_reduction_of_hours, :covid_loss_of_childcare, \
      :covid_other_situation, :covid_expenses)
  end

  # as we cannot use the multiple flag on dropdowns, we have to process their data individually,
  # rather than receiveing them from the DOM as an array
  def retreive_dropdown_info(parameter_list, element_name, number_of_elements)
    final_index = number_of_elements - 1
    return_arr = []
    for i in 0..final_index
      name_string = "%s_%d" % [element_name, i]
      return_arr.push(parameter_list[name_string])
    end
    return return_arr
  end

  def parse_dropdown_data_to_model_object(energy_app, parameters)
    energy_app.household_member_genders = retreive_dropdown_info(parameters[:energy_application], "household_member_gender", 8)
    energy_app.household_members_who_are_hispanic = retreive_dropdown_info(parameters[:energy_application], "household_member_hispanic", 8)
    energy_app.household_member_races = retreive_dropdown_info(parameters[:energy_application], "household_member_race", 8)
    energy_app.household_members_in_or_tribe = retreive_dropdown_info(parameters[:energy_application], "household_member_tribal", 8)
    energy_app.household_member_educations = retreive_dropdown_info(parameters[:energy_application], "household_member_education", 8)
    energy_app.household_members_with_disabilities = retreive_dropdown_info(parameters[:energy_application], "household_member_disabled", 8)
    energy_app.household_member_veterans = retreive_dropdown_info(parameters[:energy_application], "household_member_veteran", 8)
    energy_app.household_members_who_are_homebound = retreive_dropdown_info(parameters[:energy_application], "household_member_homebound", 8)
    energy_app.household_member_snaps = retreive_dropdown_info(parameters[:energy_application], "household_member_snap", 8)
    energy_app.household_member_ohps = retreive_dropdown_info(parameters[:energy_application], "household_member_ohp", 8)
    energy_app.household_members_over_18_without_income = retreive_dropdown_info(parameters[:energy_application], "household_members_over_18_without_income", 8)
  end
  
  def push_string_arrays_to_model_object(energy_app, parameter_list)
    energy_app.household_member_names = parameter_list[:energy_application][:household_member_name]
    energy_app.household_member_birthdates = parameter_list[:energy_application][:household_member_birthdate]
    energy_app.household_member_ssids = parameter_list[:energy_application][:household_member_ssid]
    energy_app.household_member_other_medical_insurances = parameter_list[:energy_application][:household_member_other_medical_insurances]
    energy_app.types_of_heat = parameter_list[:energy_application][:types_of_heat]
    energy_app.household_member_types_of_income = parameter_list[:energy_application][:household_member_type_of_income]
    energy_app.utility_names = parameter_list[:energy_application][:utility_]
    energy_app.utility_account_numbers = parameter_list[:energy_application][:utility_account_number]
    energy_app.utility_account_names = parameter_list[:energy_application][:utility_account_names]
    energy_app.household_member_informal_incomes_last_month = parameter_list[:energy_application][:household_member_informal_income_last_month]
    energy_app.household_member_informal_income_source = parameter_list[:energy_application][:household_member_informal_income_source]
    energy_app.household_members_in_high_school = parameter_list[:energy_application][:utility_account_names]
    
  end
end
