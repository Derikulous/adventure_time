require 'test_helper'

feature "admin exams for Brook and Ivans adventure" do
  scenario "admin tries to create a exam unsuccessfully" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # admin must sign in properly
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    click_on 'Create Exam'

    # If user clicks on creat exam without info
    click_on 'Submit'

    # Then the page renders back to new
    page.text.must_include "4 errors prohibited this exam from being saved:"
    page.text.must_include "Questions content can't be blank"
    page.text.must_include "Questions answers can't be blank"
    page.text.must_include "Experience is not a number"
    page.text.must_include "Name can't be blank"
  end

    scenario "admin successfully creates an exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # admin must sign in properly
    page.text.must_include 'Signed in successfully'
    page.text.wont_include "Sign In"

    # click on new exam
    click_on 'Create Exam'

    # inputs exams info
    fill_in 'exam_name', with: 'This is an example exam'
    fill_in 'exam_questions_attributes_0_content', with: 'This is a sample question'
    fill_in 'exam_questions_attributes_0_answers_attributes_1_content', with: 'This is a sample answer'
    fill_in 'exam_experience', with: '100'

    # click on create exam
    click_on 'Submit'

    # Success message
    page.text.must_include 'Exam was successfully created'
  end

  scenario "admin tries to edit a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # navigate to exams page
    visit exams_path

    # click on edit exam
    click_on 'Edit'

    # inputs exams info
    fill_in 'exam_name', with: 'Changing This Exam'
    fill_in 'exam_questions_attributes_0_content', with: 'Not the same question'
    fill_in 'exam_questions_attributes_0_answers_attributes_1_content', with: 'A different answer'
    fill_in 'exam_experience', with: '1'

    # click on create exam
    click_on 'Submit'

    # Success message
    page.text.must_include 'Exam was successfully updated'
    page.text.must_include 'Not the same question'
    page.text.wont_include 'This is an example exam'
    page.text.wont_include '100'
  end

  scenario "admin tries to delete a exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # navigate to exams page
    visit exams_path

    # click on destroy exam
    click_on 'Destroy'

    # Success message
    page.text.wont_include 'Example Test'

  end

  scenario "admin tries to take an exam" do

    # navigate exams page
    visit root_path

    # admin signs in
    sign_in(:one)

    # navigate to exams page
    visit exams_path

    # click on edit exam
    click_on 'Begin Quest'

    # Exam must show content
    page.text.must_include 'Which of the following is a mammal?'

    # Select an answer
    choose('answer_3')

    # click on next question
    click_on 'Next Question'
    page.text.wont_include 'gameover'
    page.text.must_include 'Continue'
    click_on 'Continue'

    # Exam page must show score
    page.text.must_include '100'
  end
end
