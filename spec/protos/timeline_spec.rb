# frozen_string_literal: true

RSpec.describe Protos::Timeline do
  subject do
    described_class.new(vertical: true) do |timeline|
      timeline.item do
        timeline.hr
        timeline.left { "Left content" }
        timeline.center { "Center content" }
        timeline.right { "Right content" }
      end
    end
  end

  before { render subject }

  it "renders the timeline" do
    expect(page).to have_css("ul")
    expect(page).to have_content("Left content")
    expect(page).to have_content("Center content")
    expect(page).to have_content("Right content")
    expect(page).to have_css("hr")
  end

  it "renders the style" do
    expect(page).to have_css(".timeline")
    expect(page).to have_css(".timeline-vertical")
  end
end
