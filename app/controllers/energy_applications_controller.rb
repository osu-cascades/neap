class EnergyApplicationsController < ApplicationController
    def index
        @enAppList = EnergyApplication.all
    end
end
