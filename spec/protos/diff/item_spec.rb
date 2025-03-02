# frozen_string_literal: true

RSpec.describe Protos::Diff::Item do
  subject { page }

  before do
    render described_class.new(order: :one) { "Content" }
  end

  context "content" do
    it { is_expected.to have_content("Content") }
  end

  context "accessibility" do
    it { is_expected.to have_css("div[role='img']") }
  end

  context "styles" do
    it { is_expected.to have_css(".diff-item-1") }
  end
end
