# Protos

A UI component library for [Phlex](https://www.phlex.fun/) using
[tailwindcss](https://tailwindcss.com/) and
[daisyUI](https://daisyui.com/).

You can see a full list of the components at
[https://protos.inhouse.work/](https://protos.inhouse.work/).

- Tailwindcss classes are merged using
[tailwind\_merge](https://github.com/gjtorikian/tailwind_merge).
- Uses [tippy.js](https://atomiks.github.io/tippyjs/v6/getting-started/) for
  dropdowns, combobox, and popovers

Other Phlex based UI libraries worth checking out:

- [PhlexUI](https://phlexui.com/)
- [ZestUI](https://zestui.com/)
- [Nitro Kit](https://github.com/mikker/nitro_kit)

Thinking of making your next static site using Phlex? Check out
[staticky](https://github.com/nolantait/staticky). The protos docs were
published using it.

## Phlex components

Phlex is a fantastic framework for building frontend components in pure Ruby:

```ruby
class Navbar
  def view_template
    header(class: "flex items-center justify-between") do
      h3 { "My site" }
      button { "Log out" }
    end
  end
end
```

But how can we sometimes render this `Navbar` with a different background color?

It would be nice to have our components take a class like any other element:

```ruby
render Navbar.new(class: "bg-primary")
```

Unfortunately `class` is a special keyword in Ruby, so we need to do some
awkward handling to use it like this:

```ruby
class Navbar
  def initialize(**options)
    # Keyword `class` is a special word in Ruby so we have to awkwardly unwrap
    # like this instead of using keyword arguments
    @classes = options[:class]
  end

  def view_template
    header(class: "#{@classes} flex items-center justify-between") do
      h3 { "My site" }
      button { "Log out" }
    end
  end
end
```

Now we can pass in a style to our container, but what about overriding the style
of the `h3` tag?

```ruby
class Navbar
  def initialize(**options)
    # Keyword `class` is a special word in Ruby so we have to awkwardly unwrap
    # like this instead of using keyword arguments
    @container_classes = options[:class]
    @title_classes = options[:title_class]
  end

  def view_template
    header(class: "#{@classes} flex items-center justify-between") do
      h3(class: @title_classes) { "My site" }
      button { "Log out" }
    end
  end
end
```

Eventually everyone makes a kind of ad-hoc system for specifying styles.

It gets more complicated when you have attributes like a data-controller. How do
you give a good experience letting people using your components to add their own
controllers while your component depends on one already?

This library is an attempt to make this kind of developer experience while
making reusable components more convention over configuration.

## Protos::Component

A protos component follows 3 conventions that make them easy to work with as
components in your app:

- [Slots and themes](#slots-and-themes)
- [Attrs and default attrs](#attrs-and-default-attrs)
- [Params and options](#params-and-options)

Every UI component library will have a tension between being too general to fit
in your app or too narrow to be useful. Making components that look good out of
the box can make them hard to customize.

We try and resolve this tension by making these components have a minimal style
that can be easily overridden using some ergonomic conventions.

### Slots and themes

Components are styled with `css` slots that get their values from a simple hash
we call a `theme`.

You define a `theme` for your component by defining a `#theme` method that
returns a hash.

Users of your components can override, merge, or remove parts of your theme by
passing in their own as an argument to the component. Another nice benefit is
that your markup doesn't get overwhelmed horizontally with your css classes.


```ruby
class List < Protos::Component
  def view_template
    ul(class: css[:list]) do
      li(class: css[:item]) { "Item 1" }
      li(class: css[:item]) { "Item 2" }
    end
  end

  def theme
    {
      list: ["space-y-4"], # We can use arrays
      item: "font-bold text-2xl" # Or just plain old strings
    }
  end
end
```

Using a theme and css slots allows us to easily override any part of a component
when we render.

Here we are passing in our own theme. The default behavior is to add these
styles on to the theme, rather than replacing them.

```ruby
render List.new(
  theme: {
    list: "space-y-8",
    item: "bg-red-500"
  }
)
```

When the component is rendered the `tailwind_merge` gem will also prune any
duplicate unneeded styles.

For example even though the themes `list` key would be added together to become
`space-y-4 space-y-8`, the `tailwind_merge` gem will prune it down to just
`space-y-8` as the two styles conflict.

```html
<ul class="space-y-8">
  <li class="font-bold text-2xl bg-red-500">Item 1</li>
  <li class="font-bold text-2xl bg-red-500">Item 2</li>
</ul>
```

We can override the slot entirely by using a `!` at the end of the key:

```ruby
render List.new(
  theme: {
    item!: "bg-red-500"
  }
)
```

The css slot `css[:item]` would be overridden rather than merged:

```html
<li class="bg-red-500">Item 1</li>
```

We can also negate a certain class or classes from the slot by putting a `!` 
at the start of the key:

```ruby
render List.new(
  theme: {
    "!item": "text-2xl"
  }
)
```

The new `css[:item]` slot would be:

```html
<li class="font-bold">Item 1</li>
```

Slots can also take multiple arguments, and even inline styles:

```ruby
class ListItem < Protos::Component
  def view_template
    li(class: css[:item, :primary_item, "text-sm"])
  end
end
```

This combines the styles together, removing any duplicates.

### Attrs and default attrs

By convention, all components spread in an `attrs` hash on their outermost
element of the component. There is no rule for this, but it makes them feel more
naturally like native html elements when you render them.

By doing this we enable 3 main conveniences:
1. We can pass a `class` keyword when initializing the component which will be
   merged safely into the `css[:container]` slot
2. We can pass any html attributes we want to the element such as `id`, `data`
   etc and it will just work
3. We can add default attributes that are safely merged with any provided to the
   component when its being initialized

```ruby
class List < Protos::Component
  def view_template
    ul(**attrs) do
      # ...
    end
  end

  private

  def default_attrs
    {
        data: { controller: "list" }
    }
  end

  def theme
    {
      container: "space-y-4",
      item: "font-bold"
    }
  end
end
```

`#attrs` returns a hash which will by default merge the `class` keyword into the
`css[:container]` slot which we define in our theme. The `ul` elements class
would be `space-y-4` as that is the `css[:container]` on our theme.

Special html options (`class`, `data`) will be safely merged. 

For examples, the component above defines a list controller. If we passed our
own controller into data when we initialize, the component's data-controller
attribute would be appended to:

```ruby
render List.new(
  data: { controller: "tooltip" }
)
```

That would output both controllers to the DOM element:

```html
<ul data-controller="list tooltip">
```

This makes it very convenient to add functionality to basic components without
overriding their core behavior or having to modify/override their class.

### Params and options

Components extend
[`Dry::Initializer`](https://dry-rb.org/gems/dry-initializer/3.1/)
which lets us easily add new positional arguments with `param` or keyword
arguments with `option`

```ruby
class List < Protos::Component
  option :ordered
end
```

This makes our initialization declarative and easy to extend without having to
consider how to call `super` in the initializer.

The following keywords are reserved in the base class:

- `class`
- `theme`
- `html_options`

You are free to add whatever positional or keyword arguments you like as long as
they don't directly conflict with those names.

## Putting it all together

Lets revisit the example of our `Navbar` component:

```ruby
require "protos"

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
      subtitle: "text-sm"
    }
  end
end
```

Now all the concerns about adding in our behavior, styles, etc are handled for
us by convention:

```ruby
render Navbar.new(
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

Setup [TailwindCSS](https://tailwindcss.com/), [DaisyUI](https://daisyui.com)
and add the protos path to your content.

```
npm install -D tailwindcss postcss autoprefixer daisyui
npx tailwindcss init
```

Then we need to add the protos path to the `content` of our tailwind config
so tailwind will read the styles defined in the Protos gem.

Protos also uses semantic spacing such as `p-sm` or `m-md` instead of set
numbers so you can easily choose the spacing you want. So we will need to extend
`spacing` in your theme.

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

Then you can use the components in your apps.

```ruby
Protos::Card.new(class: "bg-base-100") do |card|
  card.body(class: "gap-sm") do
    card.title(class: "font-bold") { "Hello world" }
    span { "This is some more content" }
    card.actions do
      button(class: "btn btn-primary") { "Action 1" }
    end
  end
end
```

## Building your own components

You can override components simply by redefining sub-classing the class in your
own app:

```ruby
module Components
  class Swap < Protos::Component
    private

    def on(...)
      MyOnButton.new(...)
    end

    def theme
      super.merge({
        input: ["block", "bg-red-500"]
      })
    end
  end
end
```

But its much better to avoid the sub-classing and just render the component
inside of your own:

```ruby
module Components
  class Swap < ApplicationComponent
    def view_template
      render Protos::Swap.new do |c|
        # ....
      end
    end
  end
end
```

You could use `Proto::List` to create your own list and even use some kind of
[`DeferredRender`](https://www.phlex.fun/miscellaneous/v2-upgrade.html#removed-deferredrender)
to make the API more convenient.

Let's create a list component with headers and actions:

```ruby
module DeferredRender
  def before_template(&)
    vanish(&)
    super
  end
end

module Ui
  class List < Protos::Component
    include Protos::Typography
    include DeferredRender

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
        container: "space-y-xs",
        header: "flex justify-between items-end gap-sm",
        list: "divide-y border w-full",
        actions: "space-x-xs",
        item: "p-sm"
      }
    end
  end
end
```

Now the component is specific to our application, and the styles are still
overridable at all levels:

```ruby
render Ui::List.new(title: "Project Names", ordered: true) do |list|
  list.with_action { link_to("Add item", "#") }
  list.with_item(class: "active") { "Project 1" }
  list.with_item { "Project 2" }
  list.with_item { "Project 3" }
end
```

Or here is another example of a table:

```ruby
module Ui
  class Table < ApplicationComponent
    include Protos::Typography
    include DeferredRender

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
    option :actions, default: -> { [] }, reader: false

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
        container: "space-y-sm",
        header: "flex justify-between items-end gap-sm",
        table: "border",
        caption: "text-muted"
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

## Missing components

Here is a list that we don't yet have components for:

- [ ] Buttons
- [ ] Calendar
- [ ] Checkbox
- [ ] File input
- [ ] Indicator
- [ ] Join
- [ ] Kbd
- [ ] Link
- [ ] Loading
- [ ] Mask
- [ ] Progress
- [ ] Radial progress
- [ ] Radio
- [ ] Range
- [ ] Select
- [ ] Skeleton
- [ ] Stack
- [ ] Text input
- [ ] Textarea
- [ ] Toggle
- [ ] Tooltip

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

## Benchmarks

You can run the benchmarks using the raketasks, e.g:

- `bin/rake benchmark:ips:table`
- `bin/rake benchmark:memory:table`
- `bin/rake benchmark:ips:theme`
- `bin/rake benchmark:ips:attributes`

There are also tasks for profiling and exploring memory consumption.

You can find the latest benchmarks in `benchmarks/`. These were run on a new
Macbook M3 Pro chip.

Currently this library is 30x slower than plain Phlex components. This is due to
the overhead of themes, attributes and other quality of life improvements.

This may seem like a lot but Phlex is so fast that rendering a large table can
still be done 4000 times per second with this lib.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
