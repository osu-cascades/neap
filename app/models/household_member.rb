class HouseholdMember < ApplicationRecord
  belongs_to :energy_application

  def to_s
    name
  end

end
