require 'test_helper'

feature "visitor tests for Brook & Ivan Adventures" do
  scenario "visitor visits main splash page" do

    # navigate to main page
    visit root_path

    # page must have title
    page.text.must_include 'Brook & Ivan Adventures'

  end

  scenario "visitor visits about page" do

    #navigate to about page
    visit '/pages/about'

    # page must have title
    page.text.must_include 'Sign In'
    page.text.must_include 'Interviews are hard mmmkay'
  end

  scenario "visitor visits the leaderboard page" do
    # navigate to leaderboard
    visit '/users'

    # page includes leaderboard
    page.text.must_include 'Leaderboard'
    page.text.must_include 'Rank'
    page.text.must_include 'james@tired.com'
  end
end
