# frozen_string_literal: true

RSpec.describe Protos::ChatBubble do
  before do
    render described_class.new(
      align: :end
    ) { "Chat bubble content" }
  end

  it "renders a chat bubble" do
    expect(page).to have_css("div")
    expect(page).to have_content("Chat bubble content")
  end

  it "renders the style" do
    expect(page).to have_css(".chat")
    expect(page).to have_css(".chat-end")
  end
end
