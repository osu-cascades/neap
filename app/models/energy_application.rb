class EnergyApplication < ApplicationRecord

  belongs_to :user

  def to_s
    "Application #{id}"
  end

end
