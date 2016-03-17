require "rails_helper"

feature "like beer" do
  scenario "current user likes a beer" do
    # user = create(:user)
    # user_visits_root_path(user)
    # like_button = first(".like-btn")
    # like_button.click

    # within(like_button) do
    #   expect(page).to have_css("span.like-count", text: 1)
    # end
  end
end

def user_visits_root_path(user)
  allow_any_instance_of(ApplicationController).
    to receive(:current_user).and_return(user)

  visit root_path
end
