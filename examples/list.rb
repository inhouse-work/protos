require "protos"

class List < Protos::Component
  def template
    ul(**attrs) do
      li(class: css[:item]) { "Item 1" }
      li(class: css[:item]) { "Item 2" }
    end
  end

  def default_attrs
    {
      data: {
        controller: "list"
      }
    }
  end

  def theme
    {
      container: tokens("space-y-4"),
      item: tokens("font-bold")
    }
  end
end

list = List.new(
  theme: {
    container: "space-y-8",
    item: "bg-red-500"
  }
)

puts list.call
