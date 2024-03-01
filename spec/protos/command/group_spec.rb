# frozen_string_literal: true

RSpec.describe Protos::Command::Group do
  before do
    render described_class.new { "Item" }
  end

  it "renders the item" do
    expect(page).to have_content("Item")
  end
end
