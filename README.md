# Protos

A UI component library for Phlex using daisyui.

Protos uses a set of conventions that make it easier to work with tailwindcss
and components in Phlex which you can use by inheriting from the base component.

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

Setup tailwindcss:

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
