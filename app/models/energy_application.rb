class EnergyApplication < ApplicationRecord

  belongs_to :user
  has_many :household_members

  def to_s
    "Application #{id}"
  end

end
