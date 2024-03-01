# frozen_string_literal: true

RSpec.describe Protos::Modal::CloseButton do
  before do
    render described_class.new { "Close" }
  end

  it "renders the dialog form" do
    expect(page).to have_css("form[method='dialog']")
  end

  it "renders a close button" do
    expect(page).to have_button
    expect(page).to have_content("Close")
  end
end
