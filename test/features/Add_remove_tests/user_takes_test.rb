require 'test_helper'

feature "A user takes an offerletter test" do
  scenario "non-user tries to take a test" do

    # Given a non-user
    visit root_path

    # When the visitor tries to take a test
    pending

    # Then the page will not include the ability to take a test
    page.must_not_include 'Take Test'
  end
end
