require 'rails_helper'

describe "association with event" do
  let(:user) { create :user }
  let!(:event) { create :event, user: user }

  it "has many events" do
    event1 = user.events.new(name: "Wonderful")
    event2 = user.events.new(name: "Extraordinary")

    expect(user.events).to include(event1)
    expect(user.events).to include(event2)
  end

  it "deletes associated events" do
    expect { user.destroy }.to change(Event, :count).by(-1)
  end
end
