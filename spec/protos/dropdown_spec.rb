# frozen_string_literal: true

RSpec.describe Protos::Dropdown do
  before do
    render described_class.new(hover: true) { "Hello, World!" }
  end

  it "renders the dropdown" do
    expect(page).to have_css("details")
    expect(page).to have_content("Hello, World!")
  end

  it "renders the styles" do
    expect(page).to have_css(".dropdown-bottom")
    expect(page).to have_css(".dropdown")
    expect(page).to have_css(".dropdown-hover")
  end
end
