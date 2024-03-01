# frozen_string_literal: true

RSpec.describe Protos::Typography::InlineLink do
  before do
    render described_class.new { "Click me" }
  end

  it "renders the inline link" do
    expect(page).to have_css("a")
    expect(page).to have_content("Click me")
  end

  it "renders the style" do
    expect(page).to have_css(".font-medium")
    expect(page).to have_css(".underline-offset-4")
    expect(page).to have_css(".cursor-pointer")
  end
end
