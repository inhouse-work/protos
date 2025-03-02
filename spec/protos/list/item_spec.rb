# frozen_string_literal: true

RSpec.describe Protos::List::Item do
  before do
    render described_class.new(grow: true, wrap: true) { "content" }
  end

  it "renders the list item" do
    expect(page).to have_css("li")
    expect(page).to have_content("content")
  end

  it "renders the styles" do
    expect(page).to have_css(".list-row")
    expect(page).to have_css(".list-col-wrap")
    expect(page).to have_css(".list-col-grow")
  end
end
