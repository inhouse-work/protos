# frozen_string_literal: true

RSpec.describe Protos::TailwindMerge do
  describe "#merge" do
    it "merges with daisyui context" do
      merged = subject.merge(%w[card-sm card-md])

      expect(merged).to eq("card-md")
    end
  end
end
