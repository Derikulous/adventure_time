require 'test_helper'

feature 'As a user, I want a profile page' do
  scenario 'The profile page will have my information' do

  # Given a signed in user
  visit new_user_session_path
  sign_in(:one)

  # When I visit the profile page
  visit profile_path

  # Then I should see my name
    page.text.must_include 'Profile'
  page.text.must_include 'Sign Out'
  page.must_have_content 'Welcome Derik@whyme.com'
  end
end
