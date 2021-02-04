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
    @energy_application.save

    for i in 1..8
      if params[:energy_application][:household_member_name][0] != nil
        @household_member = HouseholdMember.new(parent_application_id: @energy_application.id)
        @household_member.name = params[:energy_application][:household_member_name][i]
        @household_member.dob = params[:energy_application][:household_member_name][i]
        @household_member.ssn = params[:energy_application][:household_member_name][i]
        @household_member.gender = params[:energy_application][:household_member_name][i]
        @household_member.hispanic = params[:energy_application][:household_member_name][i]
        @household_member.race = params[:energy_application][:household_member_name][i]
        @household_member.tribal_member = params[:energy_application][:household_member_name][i]
        @household_member.education = params[:energy_application][:household_member_name][i]
        @household_member.disabled = params[:energy_application][:household_member_name][i]
        @household_member.veteran = params[:energy_application][:household_member_name][i]
        @household_member.homebound = params[:energy_application][:household_member_name][i]
        @household_member.snap = params[:energy_application][:household_member_name][i]
        @household_member.ohp = params[:energy_application][:household_member_name][i]
        @household_member.other_insurance = params[:energy_application][:household_member_name][i]
        @household_member.save
      end
    end
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
