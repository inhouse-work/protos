# frozen_string_literal: true

RSpec.describe Protos::Button do
  subject { page }

  before do
    render described_class.new(
      color: :success,
      variant: :dash,
      active: true,
      disabled: true,
      size: :lg,
      wide: true,
      block: true,
      shape: :square
    ) do |button|
      button.plain "Click me"
    end
  end

  it { is_expected.to have_css(".btn") }
  it { is_expected.to have_css(".btn-success") }
  it { is_expected.to have_css(".btn-dash") }
  it { is_expected.to have_css(".btn-active") }
  it { is_expected.to have_css(".btn-disabled") }
  it { is_expected.to have_css(".btn-lg") }
  it { is_expected.to have_css(".btn-wide") }
  it { is_expected.to have_css(".btn-block") }
  it { is_expected.to have_css(".btn-square") }
  it { is_expected.to have_content("Click me") }
end
