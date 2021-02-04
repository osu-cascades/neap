class EnergyApplication < ApplicationRecord

  belongs_to :user
  MAX_HOUSEHOLD_MEMBERS = 8.freeze

    def to_s
      "Application #{id}"
    end

end
