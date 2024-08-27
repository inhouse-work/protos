# frozen_string_literal: true

RSpec.describe Protos::Swap do
  subject { page }

  before do
    render described_class.new do |swap|
      swap.on { "Swap on" }
      swap.off { "Swap off" }
    end
  end

  context "content" do
    it { is_expected.to have_css("label") }
    it { is_expected.to have_field(type: :checkbox) }
    it { is_expected.to have_content("Swap on") }
    it { is_expected.to have_content("Swap off") }
  end

  context "styles" do
    it { is_expected.to have_css(".swap") }
  end

  context "accessibility" do
    it { is_expected.to have_css("input[aria-label=swap]") }
  end
end
