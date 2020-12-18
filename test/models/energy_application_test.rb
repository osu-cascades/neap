require 'test_helper'

class EnergyApplicationTest < ActiveSupport::TestCase

  test 'belongs to a user' do
    assert_respond_to(EnergyApplication.new, :user)
  end

  test 'attributes' do
    application = EnergyApplication.new
    assert_respond_to(application, :phone_number)
    assert_respond_to(application, :address)
    assert_respond_to(application, :address2)
    assert_respond_to(application, :city)
    assert_respond_to(application, :county)
    assert_respond_to(application, :zip)
  end

end
