# frozen_string_literal: true

RSpec.describe Protos::Alert do
  subject do
    described_class.new do |alert|
      alert.plain "alert"
      alert.icon { "X" }
    end
  end

  before { render subject }

  it "renders the alert" do
    expect(page).to have_css("div")
    expect(page).to have_css(".alert.alert-info")
    expect(page).to have_content("alert")
    expect(page).to have_css("div[role=alert]")
    expect(page).to have_content("X")
  end
end
