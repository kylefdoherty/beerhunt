require "rails_helper"

feature "like beer", js: true do
  before do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario "user who's logged in successfully likes a beer" do
    create(:beer)
    user_logs_in
    find(".like-btn").click

    expect(page).to have_css("span.like-count", text: 1)
  end

  scenario "user who's logged in unlikes a beer" do
    beer = create(:beer)
    user_logs_in
    # likes the beer
    find(".like-btn").click
    # unlikes the beer
    find(".like-btn").click

    expect(page).to have_css("span.like-count", text: 0)
  end
end

def user_logs_in
  visit root_path
  click_link "Login"
  click_link "Login with Facebook"
end
