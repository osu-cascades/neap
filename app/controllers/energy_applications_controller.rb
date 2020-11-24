class EnergyApplicationsController < ApplicationController
    def index
        @enAppList = EnergyApplication.all
    end

    def edit
        @enApp = EnergyApplication.find(params[:id])
        @client = User.find_by(id: @enApp.clientID)
    end
end
