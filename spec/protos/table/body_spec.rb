# frozen_string_literal: true

RSpec.describe Protos::Table::Body do
  before do
    render described_class.new { "body" }
  end

  it "renders a footer" do
    expect(page).to have_css("tbody")
    expect(page).to have_content("body")
  end
end
