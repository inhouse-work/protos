# frozen_string_literal: true

module Protos
  class Attributes
    # DOCS: A class that represents the attributes of a component. This would be
    # all html options except for `class` and `theme`.
    #
    # This class is responsible for safely merging in both user supplied and
    # default attributes. When a user adds { data: { controller: "foo" }} to
    # their component. This will merge the value in so that any default
    # controllers do not get overridden.

    def initialize(attrs = {}, **kwargs)
      @attrs = attrs.merge(kwargs)
    end

    def [](key)
      @attrs[key]
    end

    def merge(hash)
      tap do
        @attrs = mix(@attrs, hash)
      end
    end

    # Allows for the use of the `**` operator to pass the attributes to
    # a method.
    def to_hash
      @attrs
    end

    private

    def mix(*hashes)
      hashes.each_with_object({}) do |hash, result|
        hash ||= {}

        result.merge!(hash) do |_key, a, b| # rubocop:disable Metrics/ParameterLists
          case [a, b]
          in String, String then "#{a} #{b}"
          in Array, Array then a + b
          in Hash, Hash then mix(a, b)
          else b
          end
        end
      end
    end
  end
end
