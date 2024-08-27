# frozen_string_literal: true

RSpec.describe Protos::Toast::CloseButton do
  subject { page }

  before do
    render described_class.new { "Close" }
  end

  context "content" do
    it { is_expected.to have_content("Close") }
    it { is_expected.to have_button }
  end

  context "accessibility" do
    it { is_expected.to have_css("button[aria-label='close']") }
    it { is_expected.to have_css("form[method='dialog']") }
  end
end
