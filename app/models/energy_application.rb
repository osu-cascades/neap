class EnergyApplication < ApplicationRecord

    belongs_to :user

    def getAllApplications
        return EnergyApplication.all
    end

    def createApplication
        enApp = EnergyApplication.create(clientID: current_user[:id])
    end

    def retreiveApplication(eaID)
        return EnergyApplication.find_by(id: eaID)
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

    def getApplicationsForUser(userID)
        return EnergyApplication.find_by(clientID: userID)
    end


end