require "test_helper"

# Authentication helpers for system tests
module SystemTestHelpers
  def sign_in(user)
    visit new_session_path
    fill_in "email_address", with: user.email_address
    fill_in "password", with: "password"
    click_on "Sign in"
    
    assert page.has_content?("Logout"), "Not seeing logout link, authentication may have failed"
  end
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
  include SystemTestHelpers
end
