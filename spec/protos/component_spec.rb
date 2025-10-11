# frozen_string_literal: true

RSpec.describe Protos::Component do
  before do
    stub_const(
      "BaseComponent", Class.new(Protos::Component) do
        option :some_property, default: -> { "default" }

        def view_template
          h1(**attrs) { "hello" }
        end

        private

        def theme
          {
            container: "base-component"
          }
        end
      end
    )
  end

  describe "#with_theme" do
    it "returns a new instance with the merged theme" do
      render BaseComponent.new.with_theme(container: "new-class")

      expect(page).to have_css(".base-component.new-class")
    end
  end

  describe "#with_attrs" do
    it "returns a new instance with the merged attributes" do
      render BaseComponent.new.with_attrs(id: "test-id", data: { role: "test" })

      expect(page).to have_css("h1#test-id[data-role='test']")
    end
  end

  context "with an inherited class" do
    before do
      stub_const(
        "TestComponent", Class.new(BaseComponent) do
          def view_template(&)
            div(**attrs) do
              div(class: "#{css[:inner]} #{css[:overridable]}") do
                span(class: css[:non_existent]) { "Hello" }
              end
            end
          end

          private

          def default_attrs
            {
              data: {
                "test-component": "true",
                controller: "controller-one"
              }
            }
          end

          def theme
            {
              container: "test-component removed-component",
              inner: "test-component-inner",
              overridable: "removed-component"
            }
          end
        end
      )

      render TestComponent.new(
        class: "injected-class",
        role: "test",
        data: {
          value: "test",
          controller: "controller-two"
        },
        theme: {
          "!container": "removed-component",
          overridable!: "added-component"
        }
      ) { "Hello" }
    end

    it "renders the component" do
      expect(page).to have_css("div > div > span")
      expect(page).to have_content("Hello")
    end

    it "overrides the theme" do
      expect(page).to have_css(".added-component")
    end

    it "removes classes from the theme" do
      expect(page).to have_no_css(".removed-component")
    end

    it "applies the styles" do
      expect(page).to have_css(".test-component")
      expect(page).to have_css(".injected-class")
      expect(page).to have_css(".test-component-inner")
    end

    it "applies the html options" do
      expect(page).to have_css("[role='test']")
      expect(page).to have_css("[data-test-component='true']")
      expect(page).to have_css("[data-value='test']")
      expect(page).to have_css("[data-controller='controller-one controller-two']")
    end
  end
end
