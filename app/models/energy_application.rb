class EnergyApplication < ApplicationRecord

  COUNTIES = ['Crook', 'Deschutes', 'Jefferson', 'Wascoe', 'Other']

  belongs_to :user
  has_many :household_members
  has_many :utility_records
  has_many_attached :documents

  def to_s
    "Application #{id}"
  end

  def submitted?
    submission_date.present?
  end

  def unsubmitted?
    !submitted?
  end

  def status
    if submitted?
      'Sent for review'
    else
      'Not sent'
    end
  end

end
