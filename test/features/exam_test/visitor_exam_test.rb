require 'test_helper'

feature "A visitor exams for Brook and Ivans adventure" do
  scenario "non-user tries to take a exam" do

    # Given a non-user
    visit root_path

    # When the visitor tries to take a exam
    visit exams_path

    # Then the page will not include the ability to take a exam
    page.text.wont_include 'Begin Quest'
  end

  scenario "visitor tries to create a exam" do

    # navigate create exams page
    visit new_exam_path

    # visitors are not authorized to create exams
    page.text.must_include 'You need to sign in or sign up before continuing'
  end

  scenario "visitor tries to edit a exam" do

    # navigate exams page
    visit exams_path

    # visitors are not allowed to delete exams
    page.text.wont_include 'Edit'
  end

  scenario "visitor tries to destroy exam" do

    # navigate exams page
    visit exams_path

    # visitors are not allowed to delete exams
    page.text.wont_include 'Destroy'
  end

  scenario "visitor navigates to random page" do

    # navigate exams page
    visit exam_path(200)

    # visitors are not allowed to delete exams
    page.text.must_include "Sorry, we couldn't find that page"
  end

end
