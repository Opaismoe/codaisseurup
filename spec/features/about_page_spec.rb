require "rails_helper"

describe "About page" do
  it "Shows the information about the app" do
    visit root_url
    click_on "About"

    expect(page).to have_content "About this app"
  end
end
