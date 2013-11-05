require 'test_helper'

feature "admin exams for offerletter" do
  scenario "admin tries to add a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:admin)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    click_on 'New Exam'

    # inputs exams info
    fill_in 'Title', with: 'This is an example exam'
    fill_in 'Description', with: 'It is an example exam'

    # click on create exam
    click_on 'Create Exam'

    # Success message
    page.text.must_include 'Successfully created the exam'

  end
end
