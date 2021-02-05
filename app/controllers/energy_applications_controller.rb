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
    @energy_application.phone_number = params[:energy_application][:phone_number]
    @energy_application.address = params[:energy_application][:physical_street]
    @energy_application.city = params[:energy_application][:physical_city]
    @energy_application.zip = params[:energy_application][:physical_zip]
    @energy_application.county = params[:energy_application][:physical_county]
    @energy_application.save

    # extract booleans from check box arrays
    hispanic_array = extract_check_boxes(params[:energy_application][:household_member_hispanic])
    tribal_member_array = extract_check_boxes(params[:energy_application][:household_member_tribe])
    disabled_array = extract_check_boxes(params[:energy_application][:household_member_disabled])
    veteran_array = extract_check_boxes(params[:energy_application][:household_member_veteran])
    homebound_array = extract_check_boxes(params[:energy_application][:household_member_homebound])
    snap_array = extract_check_boxes(params[:energy_application][:household_member_snap])
    ohp_array = extract_check_boxes(params[:energy_application][:household_member_other_insurance])
    high_schooler_array = extract_check_boxes(params[:energy_application][:dhi_informal_income_high_schooler])

    # household members
    for i in 0..7
      if params[:energy_application][:household_member_name][i] != ""
        @household_member = HouseholdMember.new(parent_application_id: @energy_application.id)
        @household_member.name = params[:energy_application][:household_member_name][i]
        @household_member.dob = params[:energy_application][:household_member_dob][i]
        @household_member.ssn = params[:energy_application][:household_member_ssn][i]
        @household_member.gender = params[:energy_application][:household_member_gender][i]
        @household_member.hispanic = hispanic_array[i]
        @household_member.race = params[:energy_application][:household_member_race][i]
        @household_member.tribal_member = tribal_member_array[i]
        @household_member.education = params[:energy_application][:household_member_education_][i]
        @household_member.disabled = disabled_array[i]
        @household_member.veteran = veteran_array[i]
        @household_member.homebound = homebound_array[i]
        @household_member.snap = snap_array[i]
        @household_member.ohp = ohp_array[i]
        @household_member.other_insurance = params[:energy_application][:household_member_other_insurance][i]
        @household_member.save
      end
    end

    # household member income
    for i in 0..7
      if params[:energy_application][:household_income_name][i] != ""
        @household_income = HouseholdMemberIncome.new(parent_application_id: @energy_application.id)
        @household_income.name = params[:energy_application][:household_income_name][i]
        @household_income.income_type = params[:energy_application][:household_income_type][i]
      end
    end

    # DHI
    for i in 0..7
      if params[:energy_application][:dhi_informal_income_name][i] != ""
        @dhi = DeclarationOfHouseholdIncome.new(parent_application_id: @energy_application.id)
        @dhi.member_name = params[:energy_application][:dhi_informal_income_name][i]
        @dhi.informal_income_amount = params[:energy_application][:dhi_informal_income_amt][i]
        @dhi.informal_income_source = params[:energy_application][:dhi_informal_income_source][i]
        @dhi.is_highschooler = high_schooler_array[i]
      end
    end
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
    params.require(:energy_application).permit(:phone_number, :address, :address2, :city, :county, :zip)
  end

  # unchecked check boxes don't return anything, so Rails adds a subsequent hidden that always returns 0,
  # with the same name. If you're not reusing names, you only get the first one.
  # Unfortunately, if you're using an array like we are, that means for unchecked you get [0], and for
  # checked you get [0, 1]. This function takes the array, and returns the actual results.
  def extract_check_boxes(check_box_array)
    return_array = []
    i = check_box_array.length() - 1
    while i >= 0
      if check_box_array[i] == "1"
        return_array.push(true)
        i -= 2
      else
        return_array.push(false)
        i -= 1
      end
    end
    return return_array.reverse
  end

end
