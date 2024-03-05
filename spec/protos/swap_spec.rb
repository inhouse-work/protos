RSpec.describe Protos::Swap do
  before do
    render described_class.new { "Swap content" }
  end

  it "renders a swap" do
    expect(page).to have_css("label")
    expect(page).to have_field(type: :checkbox)
    expect(page).to have_content("Swap content")
  end

  it "renders the style" do
    expect(page).to have_css(".swap")
  end
end
