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
end
