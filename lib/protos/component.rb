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

    EMPTY_HASH = {}.freeze

    # Theme can override the css hash and add additional styles
    option :theme,
      as: :theme_override,
      default: -> { EMPTY_HASH },
      reader: false
    # Class becomes the :container key in the css hash
    option :class, as: :container_class, default: -> { }, reader: false

    # Adds non-defined options to the html_options hash
    def initialize(*, **kwargs, &)
      super
      @html_options = extract_html_options(kwargs)
    end

    # Allows overriding the theme of an instance after initialization.
    # This is useful for `superform` where you hand some kind of form control
    # the input:
    #
    # @example
    # class FormControl < ApplicationForm
    #   param :input_component
    #
    #   def view_template
    #     render input_component.with_theme(container: "text-red-500")
    #   end
    # end
    #
    # Because the `input_component` is an instance, there is no easy way to
    # change the theme without `with_theme`.
    #
    # @param overrides [Hash] Theme overrides to merge
    # @return [self] Returns self for chaining
    def with_theme(overrides = {})
      @theme_override = @theme_override.merge(overrides)
      self
    end

    # @see #with_theme
    # @param overrides [Hash] HTML attribute overrides to merge
    # @return [self] Returns self for chaining
    def with_attrs(overrides = {})
      @html_options = html_options.merge(overrides)
      self
    end

    private

    # Extracts the keyword arguments that are the above not declared
    # component options.
    #
    # Most components don't receive any, so we avoid allocating the
    # intermediate `defined_keys`/`extra_keys` arrays and the sliced hash
    # unless an unknown key is actually found.
    #
    # @param kwargs [Hash]
    # @return [Hash, nil]
    def extract_html_options(kwargs)
      return if kwargs.empty?

      definitions = self.class.dry_initializer.definitions
      html_options = nil

      kwargs.each do |key, value|
        next if definitions.key?(key)

        (html_options ||= {})[key] = value
      end

      html_options
    end

    def html_options
      @html_options || EMPTY_HASH
    end

    # Merged attributes like `data-controller`, `aria-*`, `id`, etc.
    def attrs
      @attrs ||= build_attrs
    end

    # Merged css classes based on the theme and overrides
    def css
      @css ||= build_theme
    end

    # Build the final attributes from all the overriding parts
    def build_attrs(...)
      defaults = default_attrs
      container = css[:container]
      attributes = html_options

      # Performance optimization: if there are no overrides and no defaults,
      # return an empty hash or just the container class.
      if attributes.empty? && (defaults.nil? || defaults.empty?)
        return container ? { class: container } : EMPTY_HASH
      end

      Attributes
        .new(...)
        .merge(defaults, attributes, container ? { class: container } : nil)
    end

    # Build the final theme from all the overriding parts
    def build_theme(...)
      # Performance optimization: if there are no overrides and no container
      # class, use the faster, immutable `Theme::Fast`.
      return Theme::Fast.new(theme) if default_theme?

      Theme
        .new(...)
        .merge(theme)
        .merge(@theme_override)
        .merge(container: @container_class)
    end

    # A theme only needs the slower, mutable `Theme` when there is something
    # to merge into it. Most components render with their default theme.
    def default_theme?
      theme_override_blank? && @container_class.nil?
    end

    def theme_override_blank?
      @theme_override.nil? || @theme_override.empty?
    end

    def default_attrs
      EMPTY_HASH
    end

    def theme
      EMPTY_HASH
    end
  end
end
