# frozen_string_literal: true

RSpec.describe Protos::ChatBubble do
  subject do
    described_class.new(align: :end) do |chat|
      chat.header { "Chat bubble header" }
      chat.image { chat.img(src: "#") }
      chat.content { "Chat bubble content" }
      chat.footer { "Chat bubble footer" }
    end
  end

  before { render subject }

  it "renders a chat bubble" do
    expect(page).to have_css("div")
    expect(page).to have_content("Chat bubble content")
    expect(page).to have_content("Chat bubble header")
    expect(page).to have_content("Chat bubble footer")
    expect(page).to have_css("img")
  end

  it "renders the style" do
    expect(page).to have_css(".chat")
    expect(page).to have_css(".chat-end")
  end
end
