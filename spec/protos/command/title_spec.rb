# frozen_string_literal: true

RSpec.describe Protos::Command::Title do
  subject { page }

  before do
    render described_class.new { "Title" }
  end

  context "content" do
    it { is_expected.to have_css("li > h2") }
    it { is_expected.to have_content("Title") }
  end

  context "styles" do
    it { is_expected.to have_css(".menu-title") }
  end
end
