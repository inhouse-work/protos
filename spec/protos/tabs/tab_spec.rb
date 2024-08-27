# frozen_string_literal: true

RSpec.describe Protos::Tabs::Tab do
  subject { page }

  before do
    render described_class.new(disabled: true, active: true) { "Tab content" }
  end

  context "content" do
    it { is_expected.to have_content("Tab content") }
  end

  context "accessibility" do
    it { is_expected.to have_css("button[disabled]") }
    it { is_expected.to have_css("button[role='tab']") }
  end

  context "styles" do
    it { is_expected.to have_css(".tab") }
    it { is_expected.to have_css(".tab-disabled") }
    it { is_expected.to have_css(".tab-active") }
  end
end
