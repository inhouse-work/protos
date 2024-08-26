# frozen_string_literal: true

RSpec.describe Protos::Drawer do
  subject { page }

  before do
    render described_class.new(id: "some_id") do |drawer|
      drawer.content do
        drawer.trigger { "Trigger" }
        drawer.plain "Main content"
      end

      drawer.side do
        drawer.plain "Sidebar content"
      end
    end
  end

  context "content" do
    it { is_expected.to have_content("Trigger") }
    it { is_expected.to have_content("Main content") }
    it { is_expected.to have_content("Sidebar content") }
  end

  context "accessibility" do
    it { is_expected.to have_field("some_id") }
  end

  context "styles" do
    it { is_expected.to have_css("div.drawer") }
  end
end
