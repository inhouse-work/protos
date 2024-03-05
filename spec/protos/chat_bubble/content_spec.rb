# frozen_string_literal: true

RSpec.describe Protos::ChatBubble::Content do
  before do
    render described_class.new(type: :primary) { "Chat bubble content" }
  end

  it "renders a chat bubble content" do
    expect(page).to have_css("div")
    expect(page).to have_content("Chat bubble content")
  end

  it "renders the style" do
    expect(page).to have_css(".chat-bubble")
    expect(page).to have_css(".chat-bubble-primary")
  end
end
