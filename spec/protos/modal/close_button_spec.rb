# frozen_string_literal: true

RSpec.describe Protos::Modal::CloseButton do
  subject { page }

  before do
    render described_class.new { "Close" }
  end

  it { is_expected.to have_css("form[method='dialog']") }
  it { is_expected.to have_button }
  it { is_expected.to have_content("Close") }
  it { is_expected.to have_css("button[data-action='protos--modal#close']") }
end
