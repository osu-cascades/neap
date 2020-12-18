class Admin::EnergyApplicationsController < Admin::AdminController

  def index
    @energy_applications = EnergyApplication.all
  end

  def show
    @energy_application = EnergyApplication.find(params[:id])
  end

  def update; end

  def destroy; end

private

  def energy_application_params
    params.require(:energy_application).permit(:phone_number, :address, :address2, :city, :county, :zip)
  end

end
