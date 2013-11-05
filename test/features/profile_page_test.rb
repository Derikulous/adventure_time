require 'test_helper'

feature 'As a user, I want a profile page' do
  scenario 'The profile page will have my information' do
    # Given a signed in user
    visit new_user_session_path
    sign_in(:one)

    # When I visit the profile page
    click_on "Profile"

    # Then I should see my name
    page.text.must_include 'Change Avatar'
    page.text.must_include 'Update Profile'
    page.must_have_content 'Report Card'
  end
end
