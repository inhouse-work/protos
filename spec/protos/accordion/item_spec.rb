# frozen_string_literal: true

RSpec.describe Protos::Accordion::Item do
  subject { page }

  before do
    render described_class.new(input_name: "some-id") { "Content 1" }
  end

  it { is_expected.to have_content "Content 1" }
  it { is_expected.to have_css ".collapse" }
  it { is_expected.to have_field("some-id") }
  it { is_expected.to have_css "input#some-id" }

  it "overrides the styles for collapse" do
    expect(page).to have_no_css ".bg-base-100"
  end

  context "when overriding the collapse styles" do
    before do
      render described_class.new(
        input_name: 1,
        input_type: :checkbox,
        theme: { collapse: "bg-red-500" }
      ) do
        "content"
      end
    end

    it "renders the collapse with the overridden styles" do
      expect(page).to have_css ".bg-red-500"
      expect(page).to have_no_css ".collapse"
      expect(page).to have_css("input#1[type=checkbox]")
    end
  end
end
