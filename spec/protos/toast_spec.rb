# frozen_string_literal: true

RSpec.describe Protos::Toast do
  subject do
    described_class.new(position: :top_center) do |toast|
      toast.plain "Toast content"
      toast.close_button { "Close" }
    end
  end

  before { render subject }

  it "renders a toast" do
    expect(page).to have_css("dialog[open]")
    expect(page).to have_content("Toast content")
    expect(page).to have_button("Close")
  end

  it "renders the styles" do
    expect(page).to have_css(".toast")
    expect(page).to have_css(".toast-top")
    expect(page).to have_css(".toast-center")
  end
end
