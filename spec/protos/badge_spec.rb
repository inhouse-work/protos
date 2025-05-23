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
      render described_class.new(type: :accent) do
        "Some content"
      end
    end

    it { is_expected.to have_css(".badge") }
    it { is_expected.to have_css(".badge-accent") }
  end

  context "with an outline" do
    before do
      render described_class.new(outline: true, soft: true, dashed: true) do
        "Some content"
      end
    end

    it { is_expected.to have_css(".badge") }
    it { is_expected.to have_css(".badge-outline") }
    it { is_expected.to have_css(".badge-soft") }
    it { is_expected.to have_css(".badge-dashed") }
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
