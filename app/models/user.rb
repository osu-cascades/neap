class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable, :recoverable,
         :rememberable, :validatable

  has_many :energy_applications

  enum role: [:guest, :admin]
  attribute :role, :integer, default: :guest

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :active, inclusion: { in: [true, false] }

  default_scope { order(:last_name) }
  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }

  def to_s
    "#{first_name} #{last_name}"
  end

  def last_name_first_name
    "#{last_name}, #{first_name}"
  end

  def active_for_authentication?
    super && active?
  end

  def status
    active? ? 'active' : 'inactive'
  end

  def name_was
    "#{first_name_was} #{last_name_was}"
  end

  def has_incomplete_energy_app?
    energy_applications.where(submission_date: nil).exists?
  end

end
