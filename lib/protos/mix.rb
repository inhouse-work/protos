# frozen_string_literal: true

module Protos
  # This class is responsible for safely merging in both user supplied
  # and default attributes. When a user adds { data: { controller: "foo" }} to
  # their component. This will merge the value in so that any default
  # controllers do not get overridden.
  module Mix
    module_function

    MERGEABLE_ATTRIBUTES = %i[class data].freeze
    MERGABLE_KEYS = %i[class controller].freeze

    def call(old_hash, *hashes)
      hashes
        .compact
        .each_with_object(old_hash) do |new_hash, result|
          merge(result, new_hash)
        end
    end

    def merge(old_hash, new_hash)
      old_hash.merge!(new_hash) do |key, old, new|
        case [old, new].freeze
        in [String, String]
          if MERGABLE_KEYS.include?(key)
            "#{old} #{new}"
          else
            new
          end
        in [Array, Array] then old + new
        in [Hash, Hash] then merge(old, new)
        in [_, nil] then old
        else new
        end
      end
    end
  end
end
