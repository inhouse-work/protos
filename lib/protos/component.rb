# frozen_string_literal: true

module Protos
  class Component < Phlex::HTML
    # DOCS: Base component for all Protos::Components. You can inherit from this
    # class to gain flexible components you can style from the outside using css
    # slots, default attrs and themes.

    extend Dry::Initializer[undefined: false]

    # Theme can override the css hash and add additional styles
    option :theme, as: :theme_override, default: -> { {} }, reader: false
    # Class becomes the :container key in the css hash
    option :class, as: :container_class, default: -> { }, reader: false

    # Adds non-defined options to the html_options hash
    def initialize(*, **kwargs, &)
      super
      attributes = self.class.dry_initializer.attributes(kwargs)
      extra_keys = kwargs.keys - attributes.keys
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
