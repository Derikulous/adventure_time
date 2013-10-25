require "test_helper"

feature "As a user, I want to sign in to the app
so that I can access my content." do
    scenario "a user signs in" do
# Given an existing user
        visit root_path
        click_on "Sign In"

# When the user creates a new session
        fill_in "Email", with: users(:one).email
        fill_in "Password", with: "password"
        click_on "Sign in"

# Then the user should be signed in
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
            uid: '12345',
            info: { nickname: 'test_linkedin_user'},
            })
        click_on "Sign in with LinkedIn"
        page.must_have_content "test_LinkedIn_user, you are signed in!"
    end

    scenario "sign in with github works" do
        visit root_path
        click_on "Sign In"
        OmniAuth.config.test_mode = true
        Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
        Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
        OmniAuth.config.add_mock(:github,
        {
            uid: '12345',
            info: { nickname: 'test_github_user'},
            })
        click_on "Sign in with GitHub"
        page.must_have_content "test_GitHub_user, you are signed in!"
    end
end
