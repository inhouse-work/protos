RSpec.describe Protos::Swap::Off do
  before do
    render described_class.new { "swap off" }
  end

  it "renders the swap off" do
    expect(page).to have_css("div")
    expect(page).to have_content("swap off")
  end

  it "renders the style" do
    expect(page).to have_css(".swap-off")
  end
end
