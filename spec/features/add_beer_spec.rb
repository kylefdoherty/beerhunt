require "rails_helper"

feature "creating a new beer" do
  scenario "creates a new beer with a valid name and description" do
    beer_name = "Sour Beer ABC"
    beer_description = "Great tasting sour."

    add_new_beer_with(name: beer_name, description: beer_description)
    user_sees_notice_with_beer(name: beer_name)
    user_sees_the_beer_listed_on_page(name: beer_name, description: beer_description)
  end
end

def add_new_beer_with(name:, description:)
  visit root_path

  fill_in "Name", with: name
  fill_in "Description", with: description
  click_button "Add Beer"
end

def user_sees_notice_with_beer(name:)
   expect(page).to have_css("div.flash", text: "Added: #{name}")
end

def user_sees_the_beer_listed_on_page(name:, description:)
  within(:css, "#beers") do
    expect(page).to have_css("h4", text: name)
    expect(page).to have_css("p", text: description)
  end
end
