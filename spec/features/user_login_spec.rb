require "rails_helper"

feature "logging in and out" do
  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario "user logs in" do
    user_logs_in

    expect(page).to have_content("Logout")
  end

  scenario "user logs out" do
    user_logs_in
    click_link "Logout"

    expect(page).to have_content("Login")
  end
end

def user_logs_in
  visit root_path
  click_link "Login"
  click_link "Login with Facebook"
end
