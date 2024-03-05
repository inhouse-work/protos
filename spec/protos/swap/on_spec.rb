RSpec.describe Protos::Swap::On do
  before do
    render described_class.new { "swap on" }
  end

  it "renders the swap on" do
    expect(page).to have_css("div")
    expect(page).to have_content("swap on")
  end

  it "renders the style" do
    expect(page).to have_css(".swap-on")
  end
end
