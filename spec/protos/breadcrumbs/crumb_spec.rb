# frozen_string_literal: true

RSpec.describe Protos::Breadcrumbs::Crumb do
  before do
    render described_class.new { "Crumb content" }
  end

  it "renders the component" do
    expect(page).to have_css("li")
    expect(page).to have_content("Crumb content")
  end
end
