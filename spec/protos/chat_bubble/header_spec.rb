# frozen_string_literal: true

RSpec.describe Protos::ChatBubble::Header do
  before do
    render described_class.new { "Chat header content" }
  end

  it "renders a chat header" do
    expect(page).to have_css("div")
    expect(page).to have_content("Chat header content")
  end

  it "renders the style" do
    expect(page).to have_css(".chat-header")
  end
end
