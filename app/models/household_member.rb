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

    attr_accessor :full_name, :dob, :ssn, :gender, :is_hispanic, :race_code, :is_OR_tribe
    attr_accessor :education_code, :is_disabled, :is_veteran, :is_homebound, :is_SNAP
    attr_accessor :is_OHP, :other_medical_insurance
end