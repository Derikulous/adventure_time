require 'test_helper'

feature "As a user, I want to sign in to the app so that I can access my content." do
  scenario "a user signs in" do
    # Given an existing user
    visit root_path
    click_on "Sign In"

    # When the user creates a new session
    within ('#signin') do
      sign_in(:one)
    end

    # Then the user should be signed in
    page.wont_have_content 'Invalid email or password.'
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Sign In"
  end

  # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing

  scenario "sign in with linkedin works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
    OmniAuth.config.add_mock(:linkedin,
    {
      email: 'user@example.com',
      uid: '12345',
      info: { nickname: 'test_linkedin_user'},
    })

    within ('#signin') do
      click_on 'Login with Linkedin'
    end

    pending 'page.must_have_content "you are signed in!"'
  end

  scenario "sign in with github works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    OmniAuth.config.add_mock(:github,
    {
      email: 'user@example.com',
      uid: '12345',
      info: { nickname: 'test_github_user'},
    })

    first(:link, "Login with Github").click

    pending 'page.must_have_content "you are signed in!"'
  end
end
