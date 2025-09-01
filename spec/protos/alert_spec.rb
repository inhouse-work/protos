# frozen_string_literal: true

RSpec.describe Protos::Alert do
  subject { page }

  before do
    render described_class.new(color: :info, variant: :soft) do |alert|
      alert.plain "alert"
      alert.icon { "X" }
    end
  end

  it { is_expected.to have_css(".alert") }
  it { is_expected.to have_css(".alert-info") }
  it { is_expected.to have_css(".alert-soft") }
  it { is_expected.to have_css(".alert-horizontal") }
  it { is_expected.to have_content("alert") }
  it { is_expected.to have_css("div[role=alert]") }
  it { is_expected.to have_content("X") }
end
