require 'test_helper'

feature "A user takes an offerletter exam" do
  scenario "non-user tries to take a exam" do

    # Given a non-user
    visit root_path

    # When the visitor tries to take a exam
    pending 'route is not functioning as intended'

    # Then the page will not include the ability to take a exam
    page.must_not_include 'Take Exam'
  end
    scenario "user tries to take a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:two)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    visit exams_path
    # Success message
    page.text.must_include 'Take Exam'

  end
    scenario "user tries to edit exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    visit exams_path

    page.text.wont_include 'Edit'

  end
end
