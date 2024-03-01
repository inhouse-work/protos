# frozen_string_literal: true

RSpec.describe Protos::Alert do
  before do
    render described_class.new { "alert" }
  end

  it "renders the alert" do
    expect(page).to have_css("div")
    expect(page).to have_css(".alert.alert-info")
    expect(page).to have_content("alert")
  end
end
