# frozen_string_literal: true

module Protos
  # The base component class that all Protos components inherit from.
  #
  # Provides core functionality for:
  # - Theme-based styling system
  # - HTML attribute management
  # - Dry::Initializer for component options
  # - Phlex::HTML integration for view templates
  #
  # @example Creating a custom component
  #   class MyComponent < Protos::Component
  #     option :title
  #     
  #     def view_template
  #       div(class: css[:container]) do
  #         h1 { title }
  #       end
  #     end
  #
  #     private
  #
  #     def theme
  #       {
  #         container: "bg-blue-500 text-white p-4"
  #       }
  #     end
  #   end
  #
  # @note Key features:
  #   - Automatically merges theme classes with overrides
  #   - Handles HTML attributes safely
  #   - Supports component options via Dry::Initializer
  #   - Integrates with Phlex for declarative HTML
  #
  # @see Protos::Theme The theme system used for styling
  # @see Protos::Attributes The attribute management system
  class Component < Phlex::HTML
    extend Dry::Initializer[undefined: false]

    # Theme can override the css hash and add additional styles
    option :theme, as: :theme_override, default: -> { {} }, reader: false
    # Class becomes the :container key in the css hash
    option :class, as: :container_class, default: -> { }, reader: false

    # Adds non-defined options to the html_options hash
    def initialize(*, **kwargs, &)
      super
      defined_keys = self.class.dry_initializer.definitions.keys
      extra_keys = kwargs.keys - defined_keys
      @html_options = kwargs.slice(*extra_keys)
    end

    private

    def attrs
      @attrs ||= build_attrs
    end

    def css
      @css ||= build_theme
    end

    def build_attrs(...)
      Attributes
        .new(...)
        .merge(default_attrs)
        .merge(@html_options)
        .merge(class: css[:container])
    end

    def build_theme(...)
      Theme
        .new(...)
        .merge(theme)
        .merge(@theme_override)
        .merge(container: @container_class)
    end

    def default_attrs
      {}
    end

    def theme
      {}
    end
  end
end
