# frozen_string_literal: true

RSpec.describe Protos::Timeline::Item do
  before do
    render described_class.new { "content" }
  end

  it "renders the item" do
    expect(page).to have_css("li")
    expect(page).to have_content("content")
  end
end
