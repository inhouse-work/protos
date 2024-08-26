# frozen_string_literal: true

RSpec.describe Protos::Drawer::Side do
  subject { page }

  before do
    render described_class.new(input_id: "some_id") { "drawer" }
  end

  context "content" do
    it { is_expected.to have_css("aside") }
    it { is_expected.to have_content("drawer") }
  end

  context "accessibility" do
    it { is_expected.to have_css("label[for=some_id]") }
  end

  context "styles" do
    it { is_expected.to have_css(".drawer-side") }
    it { is_expected.to have_css(".drawer-overlay") }
  end
end
