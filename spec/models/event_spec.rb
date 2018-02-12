require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid without a description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid without a name" do
      event = Event.new(name: nil)
      event.valid?
      expect(event.errors).to have_key(:name)
    end

    it "is invalid with a name longer than 50 characters" do
      event = Event.new(name: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. ")
      event.valid?
      expect(event.errors).to have_key(:name)
    end
  end

  describe "#bargain?" do

    let!(:bargain_event) {create :event, price: 39}
    let!(:non_bargain_event) {create :event, price: 41}

    it "Is true when it's cheaper then 40" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

#   describe ".order_by_price" do
#     let!(:event1) { create :event, price: 20 }
#     let!(:event2) { create :event, price: 300 }
#     let!(:event3) { create :event, price: 500 }
#
#     it "orders de price from cheap to expensive" do
#       #
#       expect(Event.order_by_price).to eq([event2, event1, event3])
#     end
#   end
# end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of event by prices" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end

  describe "association with user" do
  let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.build(name: "Sharing is caring")

      expect(event.user).to eq(user)
    end
  end

  describe "association with category" do
  let(:event) { create :event }

  let(:category1) { create :category, name: "Bright", events: [event] }
  let(:category2) { create :category, name: "Clean lines", events: [event] }
  let(:category3) { create :category, name: "A Man's Touch", events: [event] }

    it "has categories" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end

# describe "Is invalid if end date is before start date"
# let(:event) { create :event }

# test for registraion model

describe "association with registration" do
  let (:guest_user) { create :user, email: "whoami@gmail.com"}
  let (:host_user) { create :user, email: "hostiam@gmail.com"}

    let! (:event) { create :event, user: host_user}
    let! (:registration) { create :registration, event: event, user: guest_user}

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end


describe "association with registration" do
  let (:guest_user) { create :user, email: "whoami@gmail.com"}
  let (:host_user) { create :user, email: "hostiam@gmail.com"}

    let! (:event) { create :event, user: host_user}
    let! (:registration) { create :registration, event: event, user: guest_user}

    it "has guests" do
      expect(guest_user.registered_events).to include(event)
    end
  end
end
