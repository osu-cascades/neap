require 'test_helper'

class UtilityRecordTest < ActiveSupport::TestCase

  test 'attributes' do
    utility_record = UtilityRecord.new
    assert_respond_to(utility_record, :utility_name)
    assert_respond_to(utility_record, :account_number)
    assert_respond_to(utility_record, :accountholder_name)
  end

  test 'belongs to a energy application' do
    assert_respond_to(UtilityRecord.new, :energy_application)
  end

  test '#to_s' do
    assert_equal(UtilityRecord.new(utility_name: 'Fake').to_s, 'Fake')
  end

end
