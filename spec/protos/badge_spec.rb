# frozen_string_literal: true

RSpec.describe Protos::Badge do
  subject do
    described_class.new(type: :ghost) do
      "Some content"
    end
  end

  before { render subject }

  it "renders a badge" do
    expect(page).to have_css("span")
    expect(page).to have_content("Some content")
  end

  it "renders the style" do
    expect(page).to have_css(".badge")
    expect(page).to have_css(".badge-ghost")
  end
end
