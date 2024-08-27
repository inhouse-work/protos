# frozen_string_literal: true

RSpec.describe Protos::Tabs do
  subject { page }

  before do
    render described_class.new(type: :lifted, size: :lg) do |tabs|
      tabs.tab { "Tab 1" }
      tabs.tab { "Tab 2" }
    end
  end

  context "content" do
    it { is_expected.to have_content("Tab 1") }
    it { is_expected.to have_content("Tab 2") }
  end

  context "styles" do
    it { is_expected.to have_css(".tabs") }
    it { is_expected.to have_css(".tabs-lifted") }
    it { is_expected.to have_css(".tabs-lg") }
  end
end
