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
end
