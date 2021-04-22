require 'test_helper'

class EnergyApplicationsControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::EnergyApplicationsController, :authenticate_user!))
  end

  test 'redirects requests for someone else\'s application' do
    applicant = users(:guest)
    other_persons_application = energy_applications(:incomplete)
    refute_equal applicant, other_persons_application.user
    sign_in(applicant)
    # show
    get energy_application_path(other_persons_application)
    assert_redirected_to energy_applications_path
    # edit
    get edit_energy_application_path(other_persons_application)
    assert_redirected_to energy_applications_path
    # update
    patch energy_application_path(other_persons_application)
    assert_redirected_to energy_applications_path
    put energy_application_path(other_persons_application)
    assert_redirected_to energy_applications_path
  end

end



