require 'test_helper'

feature 'As a user, I want a profile page' do
  scenario 'The profile page will have my information' do
    # Given a signed in user
    sign_in(:two)

    # When I visit the profile page
    click_on "Profile"

    # Then I should see my name
    page.text.must_include 'No Name'
    page.text.must_include 'Change Avatar'
    page.text.must_include 'Update Profile'
    page.must_have_content 'Report Card'
    page.text.must_include 'Experience: 3'
    page.must_have_content 'Lives'
  end

   scenario 'users will be able to update their information' do
    # Given a signed in user
    sign_in(:two)

    # When I visit the profile page
    click_on "Profile"

    # Then I should see my name
    page.text.must_include 'No Name'

    # I want to update my profile
    click_on "Update Profile"

    # Change my name to something else
    fill_in 'Name', with: 'Yes Name'

    click_on "Update"
    page.text.must_include 'Yes Name'
  end
end
