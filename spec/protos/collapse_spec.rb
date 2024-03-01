# frozen_string_literal: true

RSpec.describe Protos::Collapse do
  before do
    render described_class.new { "Content" }
  end

  it "renders the content" do
    expect(page).to have_content "Content"
  end

  it "renders the styles" do
    expect(page).to have_css ".collapse"
  end
end
