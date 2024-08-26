# frozen_string_literal: true

RSpec.describe Protos::Alert::Actions do
  subject { page }

  before do
    render described_class.new { "Action" }
  end

  it { is_expected.to have_css("nav") }
  it { is_expected.to have_content("Action") }
  it { is_expected.to have_css("[aria-label=alert-actions]") }
end
