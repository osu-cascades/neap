class EnergyApplicationsController < ApplicationController

  def index
    #normal users should never see the index page; either they have an open energy application
    # to finish, or they need to make a new one
    # admins should see all unprinted energy applications
    if current_user.admin?
      search_string = "submission_date IS NOT NULL"
      @energy_applications = EnergyApplication.where(search_string)
    else
      @energy_applications = []
      draft_application = get_incomplete_energy_app()
      if draft_application != nil
        redirect_to edit_energy_application_path(id: draft_application[:id])
        return
      end
      redirect_to new_energy_application_path
    end
  end

  def show
    @energy_application = EnergyApplication.find(params[:id])
  end

  def edit
    @energy_application = EnergyApplication.find(params[:id])
    @household_members = get_household_members(@energy_application)
    @utilities = get_utilities(@energy_application)
  end

  def update
    @energy_application = EnergyApplication.find(params[:id])
    @energy_application.update(energy_application_params)
    store_subtable_data(@energy_application, params)
    if current_user.admin?
      redirect_to energy_application_path
    else
      redirect_to exit_page_url
    end
  end

  def new
    @previous_energy_application = get_previous_energy_app()
    @household_members = nil
    @utilities = nil
    if @previous_energy_application != nil
      @household_members = get_household_members(@previous_energy_application)
      @utilities = get_utilities(@previous_energy_application)
    end
    @energy_application = EnergyApplication.new
  end

  def create
    @energy_application = EnergyApplication.new(energy_application_params)
    @energy_application.user_id = current_user[:id]
    @energy_application.save
    store_subtable_data(@energy_application, params)
    if current_user.admin?
      redirect_to energy_application_path
    else
      redirect_to exit_page_url
    end
  end

  def destroy
    @energy_application = EnergyApplication.find(params[:id])
    remove_old_household_members(@energy_application)
    remove_old_utilites(@energy_application)
    @energy_application.destroy
    redirect_to energy_applications_url
  end

private

  def energy_application_params
    params.require(:energy_application).permit(:first_name, :last_name, :phone_number, :phone_type, \
      :address, :address2, :city, :county, :zip, :mailing_address_street, :mailing_address_city, \
      :mailing_address_county, :mailing_address_state, :mailing_address_zip, :how_necessities_are_paid, \
      :household_type, :type_of_dwelling, :email_address, :utility_company, \
      :residence_status, :types_of_heat, :primary_heat_source, :secondary_heat_source, :utility_name, \
      :utility_names, :utility_account_numbers, :utility_account_names, \
      :household_impacted_by_covid, :covid_loss_of_employment, \
      :covid_vulnerable_population, :covid_reduction_of_hours, :covid_loss_of_childcare, \
      :covid_other_situation, :covid_expenses, :submission_date)
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

  # add rows to subtable for household members
  def store_subtable_data(energy_app, parameters)
    # compile arrays
    gender_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_gender", 8)
    hispanic_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_hispanic", 8)
    race_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_race", 8)
    tribal_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_tribal", 8)
    education_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_education", 8)
    disabled_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_disabled", 8)
    veteran_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_veteran", 8)
    homebound_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_homebound", 8)
    snap_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_snap", 8)
    ohp_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_ohp", 8)
    over_18_no_income_arr = retreive_dropdown_info(parameters[:energy_application], "household_members_over_18_without_income", 8)
    names_arr = parameters[:energy_application][:household_member_name]
    dob_arr = parameters[:energy_application][:household_member_birthdates]
    ssn_arr = parameters[:energy_application][:household_member_ssid]
    other_insurance_arr = parameters[:energy_application][:household_member_other_medical_insurances]
    type_of_income_arr = parameters[:energy_application][:household_member_type_of_income]
    income_last_month_arr = parameters[:energy_application][:household_member_informal_incomes_last_month]
    income_source_arr = parameters[:energy_application][:household_member_informal_income_source]
    in_high_school_arr = retreive_dropdown_info(parameters[:energy_application], "household_member_in_high_school", 8)
    utility_name_arr = parameters[:energy_application][:utility_name]
    utility_account_number_arr = parameters[:energy_application][:utility_account_number]
    utility_account_holder_name_arr = parameters[:energy_application][:utility_account_names]

    # remove old records before inserting new ones
    remove_old_household_members(energy_app)
    remove_old_utilites(energy_app)

    # create new records
    for i in 0..7
      if names_arr[i] != ""
        household_member = HouseholdMember.new(parent_application_id: energy_app.id,
          name: names_arr[i], dob: dob_arr[i], ssn: ssn_arr[i], gender: gender_arr[i],
          hispanic: hispanic_arr[i], race: race_arr[i], or_tribe: tribal_arr[i],
          education: education_arr[i], disabled: disabled_arr[i], veteran: veteran_arr[i],
          homebound: homebound_arr[i], snap: snap_arr[i], ohp: ohp_arr[i],
          other_insurance: other_insurance_arr[i])
        household_member.income_type = type_of_income_arr[i]
        household_member.over_18_no_formal_income = over_18_no_income_arr[i]
        household_member.informal_income_amount = income_last_month_arr[i].to_d
        household_member.informal_income_source = income_source_arr[i]
        household_member.in_high_school = in_high_school_arr[i]
        household_member.type_of_income = type_of_income_arr[i]
        household_member.save
      end
    end
    for i in 0..2
      if utility_name_arr[i] != ""
        utility_item = UtilityRecord.new(parent_application_id: energy_app.id,
          utility_name: utility_name_arr[i],
          account_number: utility_account_number_arr[i],
          accountholder_name: utility_account_holder_name_arr[i])
        utility_item.save
      end
    end
    update_heat_types_to_energy_application(energy_app, parameters)
  end

  def remove_old_household_members(energy_app)
    old_records = get_household_members(energy_app)
    for element in old_records
      element.delete
    end
  end

  def get_household_members(energy_app)
    search_string = "parent_application_id = '%d'" % [energy_app.id]
    return HouseholdMember.where(search_string)
  end

  def remove_old_utilites(energy_app)
    old_records = get_utilities(energy_app)
    for element in old_records
      element.delete
    end
  end

  def get_utilities(energy_app)
    search_string = "parent_application_id = '%d'" % [energy_app.id]
    return UtilityRecord.where(search_string)
  end

  def get_previous_energy_app()
    # returns the most recent submitted energy application
    search_string = "user_id = '%d' AND submission_date IS NOT NULL" % [current_user[:id]]
    return_val = EnergyApplication.where(search_string).order(submission_date: :desc)
    if return_val != nil
      return return_val.first
    end
    return nil
  end

  def get_incomplete_energy_app()
    # returns the most recent incomplete energy application
    search_string = "user_id = '%d' AND submission_date IS NULL" % [current_user[:id]]
    return_val = EnergyApplication.where(search_string).order(submission_date: :desc)
    if return_val != nil
      return return_val.first
    end
    return nil
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

  def update_heat_types_to_energy_application(energy_app, parameter_list)
    energy_app.types_of_heat = []
    if parameter_list[:energy_application][:heat_type_electric] == "1"
      energy_app.types_of_heat.push("E")
    end
    if parameter_list[:energy_application][:heat_type_natural_gas] == "1"
      energy_app.types_of_heat.push("N")
    end
    if parameter_list[:energy_application][:heat_type_propane] == "1"
      energy_app.types_of_heat.push("L")
    end
    if parameter_list[:energy_application][:heat_type_oil] == "1"
      energy_app.types_of_heat.push("O")
    end
    if parameter_list[:energy_application][:heat_type_solar] == "1"
      energy_app.types_of_heat.push("S")
    end
    if parameter_list[:energy_application][:heat_type_pellets] == "1"
      energy_app.types_of_heat.push("P")
    end
    if parameter_list[:energy_application][:heat_type_wood] == "1"
      energy_app.types_of_heat.push("W")
    end
    energy_app.save
  end

end
