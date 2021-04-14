class Admin::EnergyApplicationsController < Admin::AdminController

  def index
    @energy_applications = EnergyApplication.all
  end

  def show
    @energy_application = EnergyApplication.find(params[:id])
  end

  def export

  end

  def print
    require 'prawn' # <- I don't believe this explicit require is necessary. (?)
    @energy_application = EnergyApplication.find(params[:id])
    name_string = "%s_%s_%s" % [@energy_application.last_name, @energy_application.first_name, @energy_application.submission_date]
    pdf = Prawn::Document.new
    pdf.text "PDF for %s %s\n" % [@energy_application.last_name, @energy_application.first_name]
    pdf.text "Submitted on %s\n" % [@energy_application.submission_date]
    pdf.text "Application ID# %s" % [params[:id]]
    send_data pdf.render, :filename => "%s.pdf" % [name_string], :type => "application/pdf"
  end

  def update; end

  def destroy; end

private

  def energy_application_params
    params.require(:energy_application).permit(:phone_number, :address, :address2, :city, :county, :zip)
  end

end
