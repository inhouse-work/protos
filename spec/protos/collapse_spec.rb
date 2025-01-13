# frozen_string_literal: true

RSpec.describe Protos::Collapse do
  subject { page }

  before do
    render described_class.new(checkbox: true, input_name: "123") do |collapse|
      collapse.title { "Title" }
      collapse.content { "Content" }
    end
  end

  context "accessibility" do
    it { is_expected.to have_field type: "checkbox" }
    it { is_expected.to have_field "123" }
    it { is_expected.to have_css "label[for=123]" }
  end

  context "content" do
    it { is_expected.to have_content "Title" }
    it { is_expected.to have_content "Content" }
  end

  context "styles" do
    it { is_expected.to have_css ".collapse" }
  end
end
