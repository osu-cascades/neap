class EnergyApplicationsController < ApplicationController
    def index
        @enAppList = EnergyApplication.all
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

    def update_record
        @enApp = EnergyApplication.find(params[:id])
        @enApp.clientID = params[:cid]
        @enApp.save
        redirect_to "/energy_applications"
    end
end
