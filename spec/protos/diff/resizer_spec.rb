# frozen_string_literal: true

RSpec.describe Protos::Diff::Resizer do
  subject { page }

  before do
    render described_class.new { "Content" }
  end

  context "content" do
    it { is_expected.to have_content("Content") }
    it { is_expected.to have_css("div") }
  end

  context "styles" do
    it { is_expected.to have_css(".diff-resizer") }
  end
end
