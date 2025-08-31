# frozen_string_literal: true

RSpec.describe Protos::Dropdown::Menu do
  before do
    render described_class.new(as_template: false) do |menu|
      menu.item { "Item 1" }
    end
  end

  it "renders the template" do
    expect(page).to have_css("div", visible: :hidden)
  end
end
