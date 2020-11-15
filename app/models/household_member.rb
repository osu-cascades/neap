class HouseholdMember
    def initialize(data_bundle)
        @full_name = data_bundle[0]
        @dob = data_bundle[1]
        @ssn = data_bundle[2]
        @gender = data_bundle[3]
        @is_hispanic = data_bundle[4]
        @race_code = data_bundle[5]
        @is_OR_tribe = data_bundle[6]
        @education_code = data_bundle[7]
        @is_disabled = data_bundle[8]
        @is_veteran = data_bundle[9]
        @is_homebound = data_bundle[10]
        @is_SNAP = data_bundle[11]
        @is_OHP = data_bundle[12]
        @other_medical_insurance = data_bundle[13]
    end
end