# frozen_string_literal: true

RSpec.describe Protos::Dropdown do
  subject do
    described_class.new do |dropdown|
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
    # expect(page).to have_content("Item 1")
    # expect(page).to have_content("Item 2")
  end

  it "connects the stimulus controller" do
    expect(page).to have_css("div[data-controller='protos--popover']")
  end
end
