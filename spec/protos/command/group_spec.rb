# frozen_string_literal: true

RSpec.describe Protos::Command::Group do
  before do
    render described_class.new { "Item" }
  end

  it "renders the item" do
    expect(page).to have_content("Item")
  end

  it "renders the default attributes" do
    expect(page).to have_css("li[data-protos--command-target='group']")
  end
end
