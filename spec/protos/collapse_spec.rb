# frozen_string_literal: true

RSpec.describe Protos::Collapse do
  before do
    render described_class.new(checkbox: true) { "Content" }
  end

  it "renders the checkbox" do
    expect(page).to have_field type: "checkbox"
  end

  it "renders the content" do
    expect(page).to have_content "Content"
  end

  it "renders the styles" do
    expect(page).to have_css ".collapse"
  end
end
