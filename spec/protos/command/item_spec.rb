# frozen_string_literal: true

RSpec.describe Protos::Command::Item do
  before do
    render described_class.new { "Item" }
  end

  it "renders the item" do
    expect(page).to have_css("li", text: "Item")
  end

  it "adds the stimulus target" do
    expect(page).to have_stimulus_target("protos--command", "swag")
  end

  it "adds the modal close action on form submission" do
    expect(page).to have_css("li[data-action='turbo:submit-end->protos--modal#handleFormSubmit']")
  end
end
