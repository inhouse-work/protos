# frozen_string_literal: true

RSpec.describe Protos::Collapse do
  subject { page }

  before do
    render described_class.new(checkbox: true, input_id: "123") do |collapse|
      collapse.title { "Title" }
      collapse.content { "Content" }
    end
  end

  it { is_expected.to have_field type: "checkbox" }
  it { is_expected.to have_field "123" }

  it "renders the title and content" do
    expect(page).to have_content "Content"
    expect(page).to have_content "Title"
  end

  it "renders the styles" do
    expect(page).to have_css ".collapse"
  end
end
