# frozen_string_literal: true

RSpec.describe Protos::Diff do
  subject { page }

  before do
    render described_class.new do |diff|
      diff.item_one { "Item 1" }
      diff.item_two { "Item 2" }
      diff.resizer
    end
  end

  context "content" do
    it { is_expected.to have_content("Item 1") }
    it { is_expected.to have_content("Item 2") }
  end

  context "accessibility" do
    it { is_expected.to have_css("figure[tabindex='0']") }
  end

  context "styles" do
    it { is_expected.to have_css(".diff") }
  end
end
