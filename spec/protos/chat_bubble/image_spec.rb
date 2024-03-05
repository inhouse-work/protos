# frozen_string_literal: true

RSpec.describe Protos::ChatBubble::Image do
  before do
    render described_class.new { "Chat image content" }
  end

  it "renders a chat image" do
    expect(page).to have_css("div")
    expect(page).to have_content("Chat image content")
  end

  it "renders the style" do
    expect(page).to have_css(".chat-image")
  end
end
