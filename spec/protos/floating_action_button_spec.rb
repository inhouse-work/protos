# frozen_string_literal: true

RSpec.describe Protos::FloatingActionButton do
  subject { page }

  before do
    render described_class.new do |fba|
      fba.open_button { "Click me" }
      fba.main_action { "Main Action" }
      fba.action { "Action 1" }
      fba.action { "Action 2" }
    end
  end

  context "styles" do
    it { is_expected.to have_css(".fab") }
    it { is_expected.to have_css(".fab-main-action") }
  end

  context "content" do
    it { is_expected.to have_content("Click me") }
    it { is_expected.to have_button("Main Action") }
    it { is_expected.to have_button("Action 1") }
    it { is_expected.to have_button("Action 2") }
  end

  context "accessibility" do
    it { is_expected.to have_css('div[role="button"]') }
    it { is_expected.to have_css('div[tabindex="0"]') }
  end
end
