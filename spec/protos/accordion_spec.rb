# frozen_string_literal: true

RSpec.describe Protos::Accordion do
  subject { page }

  before do
    render described_class.new do |accordion|
      accordion.item(input_id: "123") do
        accordion.title { "Item 1" }
        accordion.content { "Content 1" }
      end

      accordion.item do
        accordion.title { "Item 2" }
        accordion.content { "Content 2" }
      end
    end
  end

  it { is_expected.to have_content "Item 1" }
  it { is_expected.to have_content "Content 1" }
  it { is_expected.to have_field type: "radio" }
  it { is_expected.to have_field "123", count: 1 }
  it { is_expected.to have_css "label[for=123]", count: 1 }
  it { is_expected.to have_css "li.join-item" }
  it { is_expected.to have_css ".collapse" }
  it { is_expected.to have_css "ul.join" }
  it { is_expected.to have_css "ul.join-vertical" }
end
