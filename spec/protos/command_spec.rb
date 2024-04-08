# frozen_string_literal: true

RSpec.describe Protos::Command do
  subject do
    described_class.new do |command|
      command.trigger { "Trigger" }
      command.dialog do
        command.list do
          command.input(placeholder: "Search...")
          command.empty { "No results found" }
          command.item { "Item one" }
          command.group do
            command.title { "Group title" }
            command.item { "Item two" }
            command.item { "Item three" }
          end
        end
      end
    end
  end

  before { render subject }

  it "renders the container" do
    expect(page).to have_content "Trigger"
    expect(page).to have_content "Item one"
    expect(page).to have_content "Item two"
    expect(page).to have_content "Item three"
    expect(page).to have_content "Group title"
    expect(page).to have_content "No results found"
    expect(page).to have_field(placeholder: "Search...")
  end

  it "connects the stimulus controller for the modal" do
    expect(page).to have_css("[data-controller='protos--modal']")
  end
end
