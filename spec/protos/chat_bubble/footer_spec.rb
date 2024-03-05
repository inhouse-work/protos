# frozen_string_literal: true

RSpec.describe Protos::ChatBubble::Footer do
  before do
    render described_class.new { "Chat footer content" }
  end

  it "renders a chat footer" do
    expect(page).to have_css("div")
    expect(page).to have_content("Chat footer content")
  end

  it "renders the style" do
    expect(page).to have_css(".chat-footer")
  end
end
