# frozen_string_literal: true

RSpec.describe Protos::Toast do
  before do
    render described_class.new(position: :top_center) { "Toast content" }
  end

  it "renders a toast" do
    expect(page).to have_css("dialog[open]")
    expect(page).to have_content("Toast content")
  end

  it "renders the styles" do
    expect(page).to have_css(".toast")
    expect(page).to have_css(".toast-top")
    expect(page).to have_css(".toast-center")
  end
end
