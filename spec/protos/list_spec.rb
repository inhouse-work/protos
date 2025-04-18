# frozen_string_literal: true

RSpec.describe Protos::List do
  subject do
    described_class.new do |list|
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
    expect(page).to have_css(".list")
  end
end
