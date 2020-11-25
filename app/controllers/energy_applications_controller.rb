class EnergyApplicationsController < ApplicationController

  def index
    @energy_applications = current_user.energy_applications
  end

  def show
    @energy_application = EnergyApplication.find(params[:id])
  end

  def new
    @energy_application = EnergyApplication.new
  end

  def edit
    @enApp = EnergyApplication.find(params[:id])
    @clientID = -1
    if @enApp != nil then @clientID = @enApp.clientID end
    @client = nil
    if @clientID != -1 then @client = User.find_by(id: @enApp.clientID) end
  end

  def remove
    @enApp = EnergyApplication.find(params[:id])
    @enApp.delete
    redirect_to "/energy_applications"
  end

  def create
    enApp = EnergyApplication.create(clientID: -1)
    redirect_to "/energy_applications"
  end

  def update
    @enApp = EnergyApplication.find(params[:id])
    @enApp.clientID = params[:fcid].to_i
    @enApp.save
    redirect_to "/energy_applications"
  end

  def clientIDIndex
    @clientList = User.all
  end
end
