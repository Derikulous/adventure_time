require 'test_helper'

feature "A user takes an offerletter exam" do
  scenario "user tries to create a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:two)

    # page should not have create exam link
    page.text.wont_include 'Create Exam'

    # vist create exam path
    visit new_exam_path

    # users are not authorized to create exams
    page.text.must_include 'You are not authorized'

  end
  scenario "user tries to take a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:two)

    # navigate to exams page
    visit exams_path

    # click on edit exam
    click_on 'Take Exam'

    # Exam must show content
    page.text.must_include 'Which of the following is a mammal?'

    # Select an answer
    choose('answer_3')

    # click on next question
    click_on 'Next Question'

    # Exam page must show score
    page.text.must_include '100'

  end

  scenario "user tries to edit exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:two)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    visit exams_path

    page.text.wont_include 'Edit'

  end

  scenario "user tries to destroy exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:two)

    # page must have title
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    visit exams_path

    page.text.wont_include 'Destroy'

  end

end
