require 'test_helper'

feature "admin tests for offerletter" do
  scenario "admin tries to add a test" do

    # navigate tests page
    visit tests_path

    # admin signs in
    sign_in(:admin)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new test
    click_on 'New Test'

    # inputs tests info
    fill_in 'Title', with: 'This is an example test'
    fill_in 'Description', with: 'It is an example test'

    # click on create test
    click_on 'Create Test'

    # Success message
    page.text.must_include 'Successfully created the test'

  end
end
