# frozen_string_literal: true

RSpec.describe Protos::Badge do
  subject { page }

  before do
    render described_class.new do
      "Some content"
    end
  end

  it { is_expected.to have_css(".badge") }
  it { is_expected.to have_no_css(".badge-outline") }
  it { is_expected.to have_css("span") }
  it { is_expected.to have_content("Some content") }

  context "with a type" do
    before do
      render described_class.new(type: :ghost) do
        "Some content"
      end
    end

    it { is_expected.to have_css(".badge") }
    it { is_expected.to have_css(".badge-ghost") }
  end

  context "with an outline" do
    before do
      render described_class.new(outline: true) do
        "Some content"
      end
    end

    it { is_expected.to have_css(".badge") }
    it { is_expected.to have_css(".badge-outline") }
  end

  context "with a size" do
    before do
      render described_class.new(size: :sm) do
        "Some content"
      end
    end

    it { is_expected.to have_css(".badge") }
    it { is_expected.to have_css(".badge-sm") }
  end
end
