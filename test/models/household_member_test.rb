require 'test_helper'

class HouseholdMemberTest < ActiveSupport::TestCase

  test 'attributes' do
    household_member = HouseholdMember.new
    assert_respond_to(household_member, :name)
    assert_respond_to(household_member, :dob)
    assert_respond_to(household_member, :ssn)
    assert_respond_to(household_member, :gender)
    assert_respond_to(household_member, :hispanic)
    assert_respond_to(household_member, :race)
    assert_respond_to(household_member, :or_tribe)
    assert_respond_to(household_member, :education)
    assert_respond_to(household_member, :disabled)
    assert_respond_to(household_member, :veteran)
    assert_respond_to(household_member, :homebound)
    assert_respond_to(household_member, :snap)
    assert_respond_to(household_member, :ohp)
    assert_respond_to(household_member, :other_insurance)
    assert_respond_to(household_member, :income_type)
    assert_respond_to(household_member, :over_18_no_formal_income)
    assert_respond_to(household_member, :informal_income_amount)
    assert_respond_to(household_member, :informal_income_source)
    assert_respond_to(household_member, :in_high_school)
    assert_respond_to(household_member, :type_of_income)
  end

  test 'belongs to a energy application' do
    assert_respond_to(HouseholdMember.new, :energy_application)
  end

  test '#to_s' do
    assert_equal(HouseholdMember.new(name: 'Fake').to_s, 'Fake')
  end

end
