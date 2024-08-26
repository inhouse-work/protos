# frozen_string_literal: true

RSpec.describe Protos::Dropdown::Trigger do
  subject { page }

  before do
    render described_class.new(class: "custom") { "Trigger" }
  end

  it { is_expected.to have_css(".custom") }
  it { is_expected.to have_content("Trigger") }
end
