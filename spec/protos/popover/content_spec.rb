# frozen_string_literal: true

RSpec.describe Protos::Popover::Content do
  before do
    render described_class.new(as_template: false) { "Some content" }
  end

  it "renders the popover content" do
    expect(page).to have_css("div", visible: :hidden)
  end
end
