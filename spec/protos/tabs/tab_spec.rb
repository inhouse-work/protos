# frozen_string_literal: true

RSpec.describe Protos::Tabs::Tab do
  subject { page }

  before do
    render described_class.new(
      disabled: true,
      active: true,
      href: "/somewhere"
    ) { "Tab content" }
  end

  context "content" do
    it { is_expected.to have_content("Tab content") }
    it { is_expected.to have_link(href: "/somewhere") }
  end

  context "accessibility" do
    it { is_expected.to have_css("a[role='tab']") }
  end

  context "styles" do
    it { is_expected.to have_css(".tab") }
    it { is_expected.to have_css(".tab-disabled") }
    it { is_expected.to have_css(".tab-active") }
  end
end
