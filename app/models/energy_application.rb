class EnergyApplication < ApplicationRecord

  belongs_to :user
  has_many :household_members
  has_many :utility_records

  def to_s
    "Application #{id}"
  end

end
