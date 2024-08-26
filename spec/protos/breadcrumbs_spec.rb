# frozen_string_literal: true

RSpec.describe Protos::Breadcrumbs do
  subject { page }

  before do
    render described_class.new do |crumbs|
      crumbs.crumb { crumbs.a(href: "#") { "Item one" } }
      crumbs.crumb { "Item two" }
    end
  end

  context "content" do
    it { is_expected.to have_link("Item one") }
    it { is_expected.to have_content("Item two") }
  end

  context "styles" do
    it { is_expected.to have_css("nav.breadcrumbs") }
    it { is_expected.to have_css("ul") }
  end

  context "accessibility" do
    it { is_expected.to have_css("nav[aria-label=breadcrumbs]") }
  end
end
