require 'test_helper'

class AdminEnergyApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'requires user authentication' do
    assert(defines_before_filter?(Admin::EnergyApplicationsController, :authenticate_user!))
  end

  test 'requires an admin user' do
    assert(defines_before_filter?(Admin::EnergyApplicationsController, :restrict_unless_admin))
  end

  test 'redirects requests from unauthenticated sessions' do
    # index
    get admin_energy_applications_path
    assert_redirected_to new_user_session_path
    # show
    get admin_energy_application_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # update
    patch admin_energy_application_path(id: 'fake')
    assert_redirected_to new_user_session_path
    put admin_energy_application_path(id: 'fake')
    assert_redirected_to new_user_session_path
    # destroy
    delete admin_energy_application_path(id: 'fake')
    assert_redirected_to new_user_session_path
  end

  test 'redirects requests from guest users to root url' do
    sign_in users(:guest)
    # index
    get admin_energy_applications_path
    assert_redirected_to root_url
    # show
    get admin_energy_application_path(id: 'fake')
    assert_redirected_to root_url
    # update
    patch admin_energy_application_path(id: 'fake')
    assert_redirected_to root_url
    put admin_energy_application_path(id: 'fake')
    assert_redirected_to root_url
    # destroy
    delete admin_energy_application_path(id: 'fake')
    assert_redirected_to root_url
  end

end
