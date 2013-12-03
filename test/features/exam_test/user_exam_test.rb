require 'test_helper'

feature "A user takes an Brook and Ivans adventure exam" do
  scenario "user tries to create a exam" do

    # navigate exams page
    visit root_path

    # user signs in
    sign_in(:two)

    # page should not have create exam link
    page.text.wont_include 'Create Exam'

    # visit create exam path
    visit new_exam_path

    # users are not authorized to create exams
    page.text.must_include 'You are not authorized to view this page.'

    # and the user is redirected to the root_path
    page.text.must_include 'Sign Out'
  end

  scenario "user takes an exam and succeeds" do

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

    # Flash message is shown
    page.text.wont_include "Try again, sucker! Mwahaha!"
    page.text.wont_include 'Close Victory!'
    page.text.must_include "Oh, that's unexpected. You're correct."
    page.text.must_include 'Perfect Victory!'

    # Exam page must show score
    page.text.must_include '100'

    # now when the user goes to the exams path, the exam cannot be taken again
    visit exams_path
    page.text.must_include 'Taken'
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

  scenario 'A user takes an exam' do
    # navigate to the users page
    visit root_path

    # user signs in
    sign_in(:two)

    # visit exam path
    visit exams_path
    click_on 'Take Exam'

    # Exam must show content
    save_and_open_page
    page.text.must_include 'Which of the following is a mammal?'

    # Select an answer
    choose('answer_1')

    # click on next question
    click_on 'Next Question'

    # flash message is shown
    page.text.must_include "Try again, sucker! Mwahaha!"
    page.text.must_include 'Close Victory!'

    # Exam page must show score
    page.text.wont_include '100'
    page.text.must_include '0.0%'
  end
end
