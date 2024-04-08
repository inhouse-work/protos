# frozen_string_literal: true

RSpec.describe Protos::Breadcrumbs do
  subject do
    described_class.new do |crumbs|
      crumbs.crumb { crumbs.a(href: "#") { "Item one" } }
      crumbs.crumb { "Item two" }
    end
  end

  before { render subject }

  it "renders the component" do
    expect(page).to have_css("nav")
    expect(page).to have_css("ul")
    expect(page).to have_link("Item one")
    expect(page).to have_content("Item two")
  end

  it "renders the style" do
    expect(page).to have_css(".breadcrumbs")
  end
end
