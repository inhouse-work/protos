# frozen_string_literal: true

RSpec.describe Protos::Command::Input do
  subject { page }

  before do
    render described_class.new { "X" }
  end

  context "content" do
    it { is_expected.to have_css("li") }
    it { is_expected.to have_field(type: :text) }
    it { is_expected.to have_content("X") }
  end

  context "interactivity" do
    it { is_expected.to have_css("input[data-protos--command-target='input']") }
    it { is_expected.to have_css("input[data-action='protos--command#filter']") }
  end
end
