module EnergyApplicationsHelper
    def get_image_location
        image_path(@energy_application.documents.first)
    end
end
