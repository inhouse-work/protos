# Protos

A UI component library for Phlex using daisyui.

Protos uses a set of conventions that make it easier to work with tailwindcss
and components in Phlex which you can use by inheriting from the base component:

```ruby
require "protos"

class Navbar < Protos::Component
  def template
    header(**attrs) do
      h1(class: css[:heading]) { "Hello world" }
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
      heading: tokens("text-2xl", "font-bold")
    }
  end
end

component = Navbar.new(
  class: "my-sm",
  data: { controller: "counter" },
  theme: { heading: "p-sm" }
)

puts component.call
```

Which produces the following html:

```html
<header data-controller="navbar counter" class="flex justify-between items-center gap-sm my-sm">
  <h1 class="text-2xl font-bold p-sm">Hello world</h1>
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

Then you can use the components

```ruby
render Protos::Card.new(class: "bg-base-100") do |card|
  card.body(class: "gap-sm") do
    card.span(class: "font-bold") { "Hello world" }
    card.actions do
      card.button(class: "btn btn-primary") { "Action 1" }
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
