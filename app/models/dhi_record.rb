class DHIRecord
    def initialize(name, amt, source, hs)
        @full_name = name
        @informal_income_amt = amt
        @informal_income_source = source
        @is_in_high_school = hs
    end

    attr_accessor :full_name, :informal_income_amt, :informal_income_source, :is_in_high_school
end