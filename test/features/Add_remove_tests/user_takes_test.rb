require 'test_helper'

feature "A user takes an offerletter test" do
  scenario "non-user tries to take a test" do

    # Given a non-user
    visit root_path

    # When the visitor tries to take a test
    pending 'route is not functioning as intended'

    # Then the page will not include the ability to take a test
    page.must_not_include 'Take Test'
  end
    scenario "user tries to take a test" do

    # navigate tests page
    visit root_path

    # admin signs in
    sign_in(:two)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    visit tests_path
    # Success message
    page.text.must_include 'Take Test'

  end
    scenario "user tries to edit test" do

    # navigate tests page
    visit root_path

    # admin signs in
    sign_in(:one)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new test
    visit tests_path

    page.text.wont_include 'Edit'

  end
end
