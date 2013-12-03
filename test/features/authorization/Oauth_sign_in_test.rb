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

    within(:xpath, "//*[@id='signin']/div/div") do
      OmniAuth.config.test_mode = true
      Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
      Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
      OmniAuth.config.add_mock(:linkedin,
      {
        uid: '12345',
        info: { email: 'test@example.com', nickname: 'test_linkedin_user'},
      })

      click_on 'Login with Linkedin'
    end

    page.must_have_content "you are signed in!"
  end

  scenario "sign in with github works" do
    visit root_path
    within(:xpath, "//*[@id='signin']/div/div") do
      OmniAuth.config.test_mode = true
      Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
      Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      OmniAuth.config.add_mock(:github,
      {
        uid: '12345',
        info: { email: 'test@example.com', nickname: 'test_github_user'},
      })

      first(:link, "Login with Github").click
    end

    page.must_have_content "you are signed in!"
  end

  scenario 'a user fails to sign in' do
    # a user tries to sign in
    visit root_path
    click_on "Sign In"

    # When the incorrect information is supplied
      within(:xpath, "//*[@id='signin']/div/div") do
      fill_in "email", with: 'oh@no.com'
      fill_in "password", with: ""
      click_on "Sign in"
    end

    # Then the user should not be signed in
    page.must_have_content 'Invalid email or password.'
    page.wont_have_content "Signed in successfully"
    page.must_have_content "Sign In"
  end
end
