# Protos

A UI component library for [Phlex](https://www.phlex.fun/) using
[tailwindcss](https://tailwindcss.com/) and
[daisyUI](https://daisyui.com/).

All components avoid using
[`Phlex::DeferredRender`](https://www.phlex.fun/#slots)
so you can reorder components exactly how you like them.

Components are easy to style, positioning them is usually done through the
`class` option which applies the style to the outer most container of the
component:

```ruby
render Protos::Avatar.new(class: "my-lg") do |avatar|
  # ...
end
```

But they are also extensible to all styles by injecting a `theme` into the
component:

```ruby
render Protos::Avatar.new(theme: {
    container: "my-lg",
    figure: "p-sm" # Apply this padding to the image container
}) do |avatar|
  # ...
end
```

You can even override or negate certain parts of the theme:

```ruby
render Protos::Avatar.new(theme: {
    container!: "my-lg", # Override the original container style
    "!figure": "p-sm"    # Remove this class from the figure style
}) do |avatar|
  # ...
end
```

If the component uses a stimulus controller on the data component, or any other
default attributes you can safely add to them without overriding:

```ruby
render Protos::Avatar.new(data: { controller: "my-controller" }) do |avatar|
  # ...
end
```

This will add your attributes without removing the important ones that help the
components be accessible.

Protos uses a set of conventions that make it easier to work with tailwindcss
and components in Phlex which you can use in your own components by inheriting 
from the base component.

This adds:
1. extends `Dry::Initializer` to easily add initialization params and options
2. adds `attrs` which merges html attributes onto defaults
3. adds `default_attrs` for default html attributes on a component
4. adds `theme` for default styles hash
5. adds `css` for accessing theme slots

You can find this example in `examples/navbar.rb` which you can run with `ruby
examples/navbar.rb`:

```ruby
require "protos"

class Navbar < Protos::Component
  def template
    # **attrs will add:
    # - Any html options defined on the component initialization such as data,
    #   role, for, etc..
    # - Class will be added to the css[:container] and applied
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
      container: tokens(
        "flex",
        "justify-between",
        "items-center",
        "gap-sm"
      ),
      heading: tokens("text-2xl", "font-bold"),
      subtitle: tokens("text-base")
    }
  end
end

component = Navbar.new(
  # This will add to the component's css[:container] slot
  class: "my-sm",
  # This will add the controller and not remove
  # the existing one
  data: { controller: "counter" },
  theme: {
    heading: "p-sm",       # We can add tokens
    "!container": "gap-sm" # We can negate (remove) certain tokens
    subtitle!: "text-xl"   # We can override the entire slot
  }
)

puts component.call
```

Which produces the following html:

```html
<header data-controller="navbar counter" class="flex justify-between items-center my-sm">
  <h1 class="text-2xl font-bold p-sm">Hello world</h1>
  <h2 class="text-xl">With a subtitle</h2>
</header>
```

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add protos

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install protos

## Usage

Setup tailwindcss to add the protos path to your content.

Protos also uses semantic spacing such as `p-sm` or `m-md` instead of set
numbers so you can easily choose the spacing you want.

```js
// tailwind.config.js
// For importing tailwind styles from protos gem
const execSync = require('child_process').execSync;
const outputProtos = execSync('bundle show protos', { encoding: 'utf-8' });
const protos_path = outputProtos.trim() + '/**/*.rb';

module.exports = {
  content: [
    "./app/views/**/*.{rb,html,html.erb,erb}",
    protos_path
  ],
  theme: {
    extend: {
      spacing: {
        xs: "var(--spacing-xs)",
        sm: "var(--spacing-sm)",
        md: "var(--spacing-md)",
        lg: "var(--spacing-lg)",
        xl: "var(--spacing-xl)",
      },
      // If you use % based spacing you might want different spacing
      // for any vertical gaps to prevent overflow
      gap: {
        xs: "var(--spacing-gap-xs)",
        sm: "var(--spacing-gap-sm)",
        md: "var(--spacing-gap-md)",
        lg: "var(--spacing-gap-lg)",
        xl: "var(--spacing-gap-xl)",
      },
    },
  }
  // ....
}
```

Add [`protos-stimulus`](https://github.com/inhouse-work/protos-stimulus)
to your packages:

```
npm install protos-stimulus
```

And somewhere in your entrypoints import as a side effect:

```js
import "protos-stimulus"
```

Then you can use the components

```ruby
render Protos::Card.new(class: "bg-base-100") do |card|
  card.body(class: "gap-sm") do
    card.title(class: "font-bold") { "Hello world" }
    span { "This is some more content" }
    card.actions do
      button(class: "btn btn-primary") { "Action 1" }
    end
  end
end
```

A good idea would be to encapsulate these proto components with your own
components as a wrapper. For example you could use `Proto::List` to create your
own list and even use `Phlex::DeferredRender` to make the API more convenient.

```ruby
module Ui
  class List < Protos::Component
    include Protos::Typography
    include Phlex::DeferredRender

    option :title, default: -> {}
    option :ordered, default: -> { false }
    option :items, default: -> { [] }, reader: false
    option :actions, default: -> { [] }, reader: false

    def template
      article(**attrs) do
        header class: css[:header] do
          h3(size: :md) { title }
          nav(class: css[:actions]) do
            @actions.each do |action|
              render action
            end
          end
        end

        render Protos::List.new(ordered:, class: css[:list]) do
          @items.each { |item| render item }
          li(&@empty) if @items.empty?
        end
      end
    end

    def with_item(*, **, &block)
      theme = { container: css[:item] }
      @items << Protos::List::Item.new(*, theme:, **, &block)
    end

    def with_action(&block)
      @actions << block
    end

    def with_empty(&block)
      @empty = block
    end

    private

    def theme
      {
        container: tokens("space-y-xs"),
        header: tokens("flex", "justify-between", "items-end", "gap-sm"),
        list: tokens("divide-y", "border", "w-full"),
        actions: tokens("space-x-xs"),
        item: tokens("p-sm")
      }
    end
  end
end
```

Now the component is specific to our application, and the styles are still
overridable at all levels:

```ruby
render Ui::List.new(title: "Project Names") do |list|
  list.with_action { link_to("Add item", "#") }
  list.with_item { "Project 1" }
  list.with_item { "Project 2" }
  list.with_item { "Project 3" }
end
```

Or here is another example of a table:

```ruby
module Ui
  class Table < ApplicationComponent
    include Protos::Typography
    include Phlex::DeferredRender
    include Actionable

    class Column
      attr_reader :title

      def initialize(title, &block)
        @title = title
        @block = block
      end

      def call(item)
        @block.call(item)
      end
    end

    option :title, default: -> {}
    option :collection, default: -> { [] }, reader: false
    option :columns, default: -> { [] }, reader: false

    def template
      article(**attrs) do
        header class: css[:header] do
          h3(size: :md) { title } if title.present?
          nav(class: css[:actions]) do
            @actions.each do |action|
              render action
            end
          end
        end

        render Protos::Table.new(class: css[:table]) do |table|
          render(table.caption(class: css[:caption]), &@caption) if @caption
          render table.header do
            render table.row do
              @columns.each do |column|
                render table.head do
                  plain(column.title)
                end
              end
            end
          end

          render table.body do
            @collection.each do |item|
              render table.row do
                @columns.each do |column|
                  render table.cell do
                    column.call(item)
                  end
                end
              end
            end

            if @collection.empty?
              render table.row do
                render table.cell(colspan: @columns.length) do
                  @empty&.call
                end
              end
            end
          end
        end
      end
    end

    def with_column(...)
      @columns << Column.new(...)
    end

    def with_empty(&block)
      @empty = block
    end

    def with_caption(&block)
      @caption = block
    end

    def with_action(&block)
      @actions << block
    end

    private

    def theme
      {
        container: tokens("space-y-sm"),
        header: tokens("flex", "justify-between", "items-end", "gap-sm"),
        table: tokens("border"),
        caption: tokens("text-muted")
      }
    end
  end
end
```

Which lets you have a very nice table builder:

```ruby
collection = [
  {
    name: "John Doe",
    status: "Active",
    location: "New York"
  }
]

render Ui::Table.new(title: "A table", collection:) do |table|
  table.with_caption { "Users" }
  table.with_action do
    a(href: "#") { "Add new" }
  end

  table.with_column("Name") { |row| row[:name] }
  table.with_column("Location") { |row| row[:location] }
  table.with_column("Status") do |row|
    span(class: "badge badge-info") { row[:status] }
  end
  table.with_column("Actions") do
    a(href: "#") { "View" }
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/inhouse-work/protos.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
