# frozen_string_literal: true

RSpec.describe Protos::Drawer do
  subject do
    described_class.new(id: "some_id") do |drawer|
      drawer.content do
        drawer.trigger { "Trigger" }
        drawer.plain "Main content"
      end

      drawer.side do
        drawer.plain "Sidebar content"
      end
    end
  end

  before { render subject }

  it "renders the drawer container" do
    expect(page).to have_css("div")
    expect(page).to have_content("Trigger")
    expect(page).to have_content("Main content")
    expect(page).to have_content("Sidebar content")
  end

  it "renders the style" do
    expect(page).to have_css(".drawer")
  end
end
