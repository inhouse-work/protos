# frozen_string_literal: true

RSpec.describe Protos::Accordion do
  subject do
    described_class.new do |accordion|
      accordion.item do
        accordion.title { "Item 1" }
        accordion.content { "Content 1" }
      end
    end
  end

  before { render subject }

  it "renders the block" do
    expect(page).to have_content "Item 1"
    expect(page).to have_content "Content 1"
  end

  it "renders the styles" do
    expect(page).to have_css ".join"
    expect(page).to have_css ".join-vertical"
  end
end
