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
end
