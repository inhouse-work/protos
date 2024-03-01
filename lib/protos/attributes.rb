# frozen_string_literal: true

module Protos
  class Attributes
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
      hashes.each_with_object({}).each do |hash, result|
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
