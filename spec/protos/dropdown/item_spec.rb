# frozen_string_literal: true

RSpec.describe Protos::Dropdown::Item do
  before do
    render described_class.new { "Content 1" }
  end

  it "renders the item" do
    expect(page).to have_css "li"
    expect(page).to have_content "Content 1"
  end
end
