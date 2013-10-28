require "test_helper"

feature "visitor tests for offerletter" do
  scenario "visitor visits main splash page" do

    # navigate to main page
    visit root_path

    # page must have title
    page.text.must_include 'OfferLetter'

  end

  scenario "visitor visits main splash page" do

    #navigate to about page
    visit about_path

    # page must have title
    page.text.must_include 'OfferLetter is a'

  end
end
