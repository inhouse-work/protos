# frozen_string_literal: true

RSpec.describe Protos::Accordion::Item do
  before do
    render described_class.new(id: 1) { "Content 1" }
  end

  it "renders the item" do
    expect(page).to have_content "Content 1"
  end

  it "renders the collapse" do
    expect(page).to have_css ".collapse"
  end

  it "renders the id" do
    expect(page).to have_field("1")
  end
end
