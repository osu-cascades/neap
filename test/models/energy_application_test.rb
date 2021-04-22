require 'test_helper'

class EnergyApplicationTest < ActiveSupport::TestCase

  test 'attributes' do
    application = EnergyApplication.new
    assert_respond_to(application, :phone_number)
    assert_respond_to(application, :address)
    assert_respond_to(application, :address2)
    assert_respond_to(application, :city)
    assert_respond_to(application, :county)
    assert_respond_to(application, :zip)
    assert_respond_to(application, :first_name)
    assert_respond_to(application, :last_name)
    assert_respond_to(application, :mailing_address_street)
    assert_respond_to(application, :mailing_address_city)
    assert_respond_to(application, :mailing_address_state)
    assert_respond_to(application, :mailing_address_zip)
    assert_respond_to(application, :mailing_address_county)
    assert_respond_to(application, :type_of_dwelling)
    assert_respond_to(application, :residence_status)
    assert_respond_to(application, :types_of_heat)
    assert_respond_to(application, :primary_heat_source)
    assert_respond_to(application, :secondary_heat_source)
    assert_respond_to(application, :utility_company)
    assert_respond_to(application, :household_member_types_of_income)
    assert_respond_to(application, :utility_names)
    assert_respond_to(application, :utility_account_numbers)
    assert_respond_to(application, :utility_account_names)
    assert_respond_to(application, :household_members_over_18_without_income)
    assert_respond_to(application, :how_necessities_are_paid)
    assert_respond_to(application, :household_impacted_by_covid)
    assert_respond_to(application, :covid_loss_of_employment)
    assert_respond_to(application, :covid_reduction_of_hours)
    assert_respond_to(application, :covid_vulnerable_population)
    assert_respond_to(application, :covid_loss_of_childcare)
    assert_respond_to(application, :covid_other_situation)
    assert_respond_to(application, :covid_expenses)
    assert_respond_to(application, :phone_type)
    assert_respond_to(application, :household_type)
    assert_respond_to(application, :email_address)
    assert_respond_to(application, :submission_date)
    assert_respond_to(application, :confirmation_date)
    assert_respond_to(application, :contact_type)
    assert_respond_to(application, :contact_info)
  end

  test 'associations' do
    assert_respond_to(EnergyApplication.new, :user)
    assert_respond_to(EnergyApplication.new, :household_members)
    assert_respond_to(EnergyApplication.new, :utility_records)
  end

  test '#to_s' do
    assert_match(EnergyApplication.new.to_s, "Application ")
  end

  test '#submitted?' do
    refute EnergyApplication.new.submitted?
    assert EnergyApplication.new(submission_date: Date.current).submitted?
  end

  test '#status' do
    unsubmitted_application = EnergyApplication.new
    refute unsubmitted_application.submitted?
    assert_equal(unsubmitted_application.status, 'Not sent')
    submitted_application = EnergyApplication.new(submission_date: Date.current)
    assert submitted_application.submitted?
    assert_equal(submitted_application.status, 'Sent for review')
  end

end
