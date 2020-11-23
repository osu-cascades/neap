class EnergyApplication < ApplicationRecord
    def getAllApplications
        return EnergyApplication.all
    end

    def createApplication
        enApp = EnergyApplication.create(clientID: current_user[:id])
    end

    def updateApplication(eaID, eaData)
        enApp = EnergyApplication.find_by(id: eaID)
        # update here
        enApp.save
    end

    def destroyApplication(eaID)
        enApp = EnergyApplication.find_by(id: eaID)
        if enApp != nil
            enApp.delete
        end
    end


end