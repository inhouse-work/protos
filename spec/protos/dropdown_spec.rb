# frozen_string_literal: true

RSpec.describe Protos::Dropdown do
  subject do
    described_class.new(options: { boundary: "viewport" }) do |dropdown|
      dropdown.trigger { "Trigger" }
      dropdown.menu do
        dropdown.item { "Item 1" }
        dropdown.item { "Item 2" }
      end
    end
  end

  before { render subject }

  it "renders the dropdown" do
    expect(page).to have_css("div")
    expect(page).to have_content("Trigger")
  end

  it "connects the stimulus controller" do
    expect(page).to have_css("div[data-controller='protos--popover']")

    options = page.find("div[data-controller='protos--popover']")["data-protos--popover-options-value"]
    json = JSON.parse(options)

    expect(json["boundary"]).to eq("viewport")
  end
end
