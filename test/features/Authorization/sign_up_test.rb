require 'test_helper'

feature 'As a site visitor, I want to be able to sign up to use the site by creating an account' do
  scenario 'Sign up' do

    # Given a registration form
    visit root_path
    page.must_have_content 'Create Account'
    page.text.wont_include 'Sign Out'
    click_on 'Create Account'

    #When I register with valid information
    within('#myModal1') do
      fill_in 'email', with: 'bed@sleepy.com', :match => :prefer_exact
      fill_in 'password', with: 'jameschuangchuangchuang', :match => :prefer_exact
      fill_in 'password confirmation', with: 'jameschuangchuangchuang', :match => :prefer_exact
    end
      click_on 'Sign up'

    # Then I should be signed up
    page.text.must_include 'Welcome! You have signed up successfully.'
    page.wont_have_content 'There was a problem with your sign up'
    page.text.wont_include 'Sign up'
  end
end
