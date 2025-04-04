# frozen_string_literal: true

RSpec.describe Protos::Menu do
  subject do
    described_class.new(class: "custom") do |list|
      list.item { "Item one" }
      list.item { "Item two" }
    end
  end

  before { render subject }

  it "renders the list" do
    expect(page).to have_css("ul")
    expect(page).to have_content("Item one")
    expect(page).to have_content("Item two")
  end

  it "renders the style" do
    expect(page).to have_css(".menu")
    expect(page).to have_css(".custom")
  end
end
