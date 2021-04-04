class UtilityRecord < ApplicationRecord
  belongs_to :energy_application

  def to_s
    utility_name
  end
end
