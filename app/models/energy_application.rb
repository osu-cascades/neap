class EnergyApplication < ApplicationRecord

  COUNTIES = ['Crook', 'Deschutes', 'Jefferson', 'Wascoe', 'Other']

  belongs_to :user
  has_many :household_members
  has_many :utility_records
  has_many_attached :documents

  def to_s
    "Application #{id}"
  end

end
