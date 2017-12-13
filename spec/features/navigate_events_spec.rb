require 'rails_helper'

describe "Navigating events" do
  before { login_as user }

  let(:user) { create :user }
  let!(:event) { create :event , user: user }

  it "allows navigation from the detail page to the listing page" do
    visit event_url(event)

    click_link "Back"

    expect(current_path).to eq(events_path)
  end
end
