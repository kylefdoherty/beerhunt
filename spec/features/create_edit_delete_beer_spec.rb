require "rails_helper"

feature "create new beer" do
  scenario "admin user creates a new beer" do
    admin_user_visits_root_path

    expect(page).to have_css("h2", text: "Add a New Beer")
  end

  scenario "non-admin user can't create a new beer" do
    non_admin_user_visits_root_path

    expect(page).to_not have_css("h2", text: "Add a New Beer")
  end
end

feature "delete beer" do
  scenario " admin user deletes a beer" do
    beer = create(:beer)
    admin_user_visits_root_path
    first(".delete-beer").click

    expect(page).to_not have_content(beer.name)
  end

  scenario "non-admin user can't delete beers" do
    create(:beer)
    non_admin_user_visits_root_path

    expect(page).to_not have_css(".delete-beer")
  end
end

def admin_user_visits_root_path
  admin_user = build(:user, admin: true)
  allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(admin_user)

  visit root_path
end

def non_admin_user_visits_root_path
  non_admin_user = build(:user)
  allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(non_admin_user)

  visit root_path
end
