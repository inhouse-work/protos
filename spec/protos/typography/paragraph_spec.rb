# frozen_string_literal: true

RSpec.describe Protos::Typography::Paragraph do
  before do
    render described_class.new
  end

  it "renders the paragraph" do
    expect(page).to have_css("p")
    expect(page).to have_css(".leading-relaxed")
  end
end
