# frozen_string_literal: true

RSpec.describe Protos::Breadcrumbs do
  before do
    render(described_class.new) { "Breadcrumbs content" }
  end

  it "renders the component" do
    expect(page).to have_css("nav")
    expect(page).to have_css("ul")
    expect(page).to have_content("Breadcrumbs content")
  end

  it "renders the style" do
    expect(page).to have_css(".breadcrumbs")
  end
end
