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
      hashes.each { |new_hash| merge(old_hash, new_hash) unless new_hash.nil? }
      old_hash
    end

    def merge(old_hash, new_hash)
      old_hash.merge!(new_hash) { |key, old, new| merge_value(key, old, new) }
    end

    def merge_value(key, old, new)
      return old if new.nil?

      if old.is_a?(String) && new.is_a?(String)
        return merge_string(key, old, new)
      end

      return old + new if old.is_a?(Array) && new.is_a?(Array)
      return merge(old, new) if old.is_a?(Hash) && new.is_a?(Hash)

      new
    end

    def merge_string(key, old, new)
      MERGABLE_KEYS.include?(key) ? "#{old} #{new}" : new
    end
  end
end
