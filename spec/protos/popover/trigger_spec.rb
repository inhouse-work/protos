# frozen_string_literal: true

RSpec.describe Protos::Popover::Trigger do
  subject { page }

  before do
    render described_class.new { "Some trigger" }
  end

  context "content" do
    it { is_expected.to have_css("button") }
    it { is_expected.to have_content("Some trigger") }
  end

  context "interactivity" do
    it { is_expected.to have_css("button[data-protos--popover-target='trigger']") }
  end

  context "accessibility" do
    it { is_expected.to have_css("button[tabindex='0']") }
    it { is_expected.to have_css("button[type='button']") }
  end

  context "when rendered as a link" do
    before do
      render described_class.new(as: :a, href: "/help") { "Some trigger" }
    end

    it { is_expected.to have_css("a[href='/help']") }
    it { is_expected.to have_css("a[data-protos--popover-target='trigger']") }
    it { is_expected.to have_css("a[tabindex='0']") }
    it { is_expected.not_to have_css("a[type='button']") }
  end

  context "when rendered as a div" do
    before do
      render described_class.new(as: :div) { "Some trigger" }
    end

    it { is_expected.to have_css("div[data-protos--popover-target='trigger']") }
    it { is_expected.not_to have_css("div[type='button']") }
  end
end
