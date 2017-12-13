require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S") }

    let!(:buursink) { create :profile, first_name: "Buursink"  }
    let!(:saladin) { create :profile, first_name: "Saladin"  }
    let!(:senders) { create :profile, first_name: "Senders"  }

    it "returns the profiles that match the initial" do
      expect(subject).to match_array([saladin, senders])
    end

    it "is sorted on first_name" do
      expect(subject).to eq([saladin, senders])
    end
  end
end
