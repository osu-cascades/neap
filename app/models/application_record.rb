class ApplicationRecord < ActiveRecord::Base
  #self.abstract_class = true

  def initialize()
    @applicant_primary_key
    @form_date
    @household_members = []
    @phone_number
    @phone_type
    @household_type
    # address info
    @p_addr_street
    @p_addr_city
    @p_addr_state
    @p_addr_zip
    @p_addr_county
    @m_addr_street
    @m_addr_city
    @m_addr_state
    @m_addr_zip
    @m_addr_county
    # dwelling info
    @type_of_dwelling_code
    @residence_status_code
    @types_of_heat = []
    @primary_heat
    @secondary_heat
    @utility_company
    @income_by_household_member = [] # pairs of [name:source]
    # DHI
    @previous_month
    @dhi = [] # declaration of household income rows
    @current_payment_type
    # COVID info
    @is_covid_impacted
    @has_covid_employment_loss
    @has_covid_reduced_income
    @is_covid_vulnerable
    @has_covid_childcare_loss
    @covid_expenses
  end

  def ApplicationRecord::get_records_by_user(user_key)
    ApplicationRecord.where("user_primary_key < ?", user_key)
  end
end
