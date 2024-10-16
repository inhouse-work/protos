# frozen_string_literal: true

require_relative "../lib/protos"

class Navbar < Protos::Component
  def view_template
    header(**attrs) do
      h1(class: css[:heading]) { "Hello world" }
      h2(class: css[:subtitle]) { "With a subtitle" }
    end
  end

  private

  def default_attrs
    {
      data: { controller: "navbar" }
    }
  end

  def theme
    {
      container: "flex justify-between items-center gap-sm",
      heading: "text-2xl font-bold",
      subtitle: "text-base"
    }
  end
end

component = Navbar.new(
  class: "my-sm",
  data: { controller: "counter" },
  theme: {
    heading: "p-sm",        # We can add tokens
    "!container": "gap-sm", # We can negate (remove) certain tokens
    subtitle!: "text-xl"    # We can override the entire slot
  }
)

puts component.call
