# frozen_string_literal: true

RSpec.describe Protos::Command::Item do
  before do
    render described_class.new { "Item" }
  end

  it "renders the item" do
    expect(page).to have_css("li")
    expect(page).to have_content("Item")
  end

  it "adds the stimulus target" do
    expect(page).to have_css("[data-protos--command-target='item']")
  end
end
