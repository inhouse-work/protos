# frozen_string_literal: true

RSpec.describe Protos::Combobox do
  subject do
    described_class.new do |combo|
      combo.trigger { "Trigger" }
      combo.content do
        combo.input(placeholder: "Search...")
        combo.empty { "No results found" }
        combo.item { "Item one" }
        combo.group do
          combo.title { "Group title" }
          combo.item { "Item two" }
        end
      end
    end
  end

  before { render subject }

  it "renders the component" do
    expect(page).to have_css("div")
    expect(page).to have_content("Trigger")
    # expect(page).to have_field(placeholder: "Search...")
    # expect(page).to have_content("Item one")
    # expect(page).to have_content("Item two")
    # expect(page).to have_content("Group title")
    # expect(page).to have_content("No results found")
  end

  it "adds the stimulus controllers" do
    expect(page).to have_css("[data-controller='protos--popover']")
  end
end
